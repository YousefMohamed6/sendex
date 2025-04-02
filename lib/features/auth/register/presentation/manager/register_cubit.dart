import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sendex/core/services/sf_service.dart';
import 'package:sendex/core/utils/constants/sf_keys.dart';
import 'package:sendex/features/auth/register/data/models/user_model.dart';
import 'package:sendex/features/auth/register/domain/use_case/create_user_with_email_and_password.dart';
import 'package:sendex/features/auth/register/domain/use_case/save_user_data_use_case.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final SaveUserDataUseCase _saveUserDataUseCase;
  final CreateUserWithEmailAndPasswordUseCase _createUserWithEmailAndPassword;
  RegisterCubit(this._createUserWithEmailAndPassword, this._saveUserDataUseCase)
    : super(RegisterState.initial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  bool _obscuretext = true;
  bool isAccept = true;
  bool get obscuretext => _obscuretext;
  UserModel get userModel => UserModel(
    email: emailTextController.text,
    firstName: firstNameTextController.text,
    lastName: lastNameTextController.text,
    address: addressTextController.text,
  );
  void changeAccpetTermsAndPrivacy() {
    isAccept = !isAccept;
    setState();
  }

  void changeObscureText() {
    _obscuretext = !_obscuretext;
    setState();
  }

  void setState() {
    emit(RegisterState.initial());
    emit(RegisterState.updateUI());
  }

  Future<void> signUp() async {
    emit(RegisterState.loading());
    if (formKey.currentState!.validate()) {
      await _createUserWithEmailAndPassword.execute(
        email: emailTextController.text,
        password: passwordTextController.text,
        displyName:
            '${firstNameTextController.text} ${lastNameTextController.text}',
      );
    } else {
      throw Exception('Form is not valid');
    }
  }

  Future<void> saveUser() async {
    try {
      emit(RegisterState.loading());
      await _saveUserDataUseCase.execute(userModel);
      emit(RegisterState<UserModel>.success(userModel));
    } catch (e) {
      emit(RegisterState<String>.failure(e.toString()));
    }
  }

  Future<void> cacheUserEmail() async {
    await SharedPreferencesService.saveString(
      SfKeys.userEmail,
      emailTextController.text,
    );
  }

  Future<void> registerClient() async {
    try {
      await signUp();
      await cacheUserEmail();
      emit(RegisterState<bool>.success(true));
    } on FirebaseException catch (e) {
      emit(RegisterState<String>.failure(e.code));
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
    }
  }

  @override
  Future<void> close() async {
    emailTextController.dispose();
    passwordTextController.dispose();
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    super.close();
  }
}
