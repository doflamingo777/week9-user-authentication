import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI {
  late FirebaseAuth auth;

  FirebaseAuthAPI() {
    auth = FirebaseAuth.instance;
  }

  Stream<User?> fetchUser() {
    return auth.authStateChanges();
  }

  User? getUser() {
    return auth.currentUser;
  }

  Future<void> signUp(
      String email, String password, String firstName, String lastName) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      print('Firebase Error: ${e.code} : ${e.message}');
    } catch (e) {
      print('Firebase Error: ${e}');
    }
  }

  Future<String?> signIn(
      String email, String password, String firstName, String lastName) async {
    try {
      UserCredential credentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credentials);
      print("DSGAFGSDFGSDFGSDFGSDFGDSFGTQERJDFHLSKAJFHASKJDFH");
      return "Success";
    } on FirebaseException catch (e) {
      return ('Firebase Error: ${e.code} : ${e.message}');
    } catch (e) {
      return ('Firebase Error: ${e}');
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
