import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../rest_password/rest_password_test.mocks.dart';


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
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer((_) async => mockUserCredential);

    final result = await mockFirebaseAuth.signInWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password123',
    );

    expect(result.user, isNotNull);
  });

  test('Failed login throws FirebaseAuthException', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenThrow(FirebaseAuthException(code: 'user-not-found'));

    expect(
      () async => await mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'wrong@example.com',
        password: 'wrongpassword',
      ),
      throwsA(isA<FirebaseAuthException>()),
    );
  });

  test('Successful sign up returns a User', () async {
    when(mockUserCredential.user).thenReturn(mockUser);
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer((_) async => mockUserCredential);

    final result = await mockFirebaseAuth.createUserWithEmailAndPassword(
      email: 'newuser@example.com',
      password: 'newpassword123',
    );

    expect(result.user, isNotNull);
  });

  test('Failed sign up throws FirebaseAuthException', () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

    expect(
      () async => await mockFirebaseAuth.createUserWithEmailAndPassword(
        email: 'existing@example.com',
        password: 'password123',
      ),
      throwsA(isA<FirebaseAuthException>()),
    );
  });

  test('Successful password reset', () async {
    when(mockFirebaseAuth.sendPasswordResetEmail(
      email: anyNamed('email'),
    )).thenAnswer((_) async {});

    await mockFirebaseAuth.sendPasswordResetEmail(email: 'reset@example.com');
    verify(mockFirebaseAuth.sendPasswordResetEmail(email: 'reset@example.com')).called(1);
  });

  test('Failed password reset throws FirebaseAuthException', () async {
    when(mockFirebaseAuth.sendPasswordResetEmail(
      email: anyNamed('email'),
    )).thenThrow(FirebaseAuthException(code: 'user-not-found'));

    expect(
      () async => await mockFirebaseAuth.sendPasswordResetEmail(email: 'unknown@example.com'),
      throwsA(isA<FirebaseAuthException>()),
    );
  });
}
