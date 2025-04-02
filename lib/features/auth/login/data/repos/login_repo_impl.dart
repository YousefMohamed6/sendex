import 'package:sendex/core/services/firebase_firestore_service.dart';
import 'package:sendex/features/auth/login/domain/repo/i_login_repo.dart';

class LoginRepoImpl implements ILoginRepo {
  final FirebaseFirestoreService firebaseFirestoreService;

  LoginRepoImpl({required this.firebaseFirestoreService});
}
