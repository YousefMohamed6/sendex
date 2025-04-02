import 'package:sendex/features/auth/register/data/models/user_model.dart';

abstract class IRegisterRepo {
  Future<void> saveUserData(UserModel userModel);
}
