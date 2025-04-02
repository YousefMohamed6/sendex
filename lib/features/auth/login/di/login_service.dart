import 'package:get_it/get_it.dart';
import 'package:sendex/core/extentions/getit_extension.dart';
import 'package:sendex/core/services/firebase_firestore_service.dart';
import 'package:sendex/features/auth/login/data/repos/login_repo_impl.dart';
import 'package:sendex/features/auth/login/domain/repo/i_login_repo.dart';
import 'package:sendex/features/auth/login/presentation/manager/login_cubit.dart';

class LoginService {
  final sl = GetIt.I;
  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<ILoginRepo>(
      () => LoginRepoImpl(firebaseFirestoreService: sl()),
    );

    sl.registerFactorySafely<LoginCubit>(() => LoginCubit());
  }
}
