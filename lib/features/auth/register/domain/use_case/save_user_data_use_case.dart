import 'package:sendex/features/auth/register/data/models/user_model.dart';
import 'package:sendex/features/auth/register/domain/repos/i_register_repo.dart';

class SaveUserDataUseCase {
  final IRegisterRepo _registerRepo;

  SaveUserDataUseCase(this._registerRepo);

  Future<void> execute(UserModel user) async {
    await _registerRepo.saveUserData(user);
  }
}
