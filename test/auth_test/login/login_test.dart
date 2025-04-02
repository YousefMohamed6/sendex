import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserCredential, User])
void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
  });

  test('Successful login returns a User', () async {
    when(mockUserCredential.user).thenReturn(mockUser);
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      ),
    ).thenAnswer((_) async => mockUserCredential);

    final result = await mockFirebaseAuth.signInWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password123',
    );

    expect(result.user, isNotNull);
  });

  test('Failed login throws FirebaseAuthException', () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      ),
    ).thenThrow(FirebaseAuthException(code: 'user-not-found'));

    expect(
      () async => await mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'wrong@example.com',
        password: 'wrongpassword',
      ),
      throwsA(isA<FirebaseAuthException>()),
    );
  });
}
