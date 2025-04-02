import 'package:sendex/core/services/firebase_firestore_service.dart';
import 'package:sendex/core/utils/constants/app_keys.dart';
import 'package:sendex/features/auth/register/data/models/user_model.dart';
import 'package:sendex/features/auth/register/domain/repos/i_register_repo.dart';

class RegisterRepoImpl implements IRegisterRepo {
  final FirebaseFirestoreService _firebaseFirestoreService;

  RegisterRepoImpl(this._firebaseFirestoreService);

  @override
  Future<void> saveUserData(UserModel userModel) {
    return _firebaseFirestoreService.addDocumentUsingId(
      collectionId: AppKeys.kUserCollection,
      documentId: userModel.email,
      data: userModel.toJson(),
    );
  }
}
