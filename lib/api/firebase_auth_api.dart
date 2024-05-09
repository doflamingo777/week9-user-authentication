import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI {
  late FirebaseAuth auth;
  late FirebaseFirestore database;

  FirebaseAuthAPI() {
    auth = FirebaseAuth.instance;
    database = FirebaseFirestore.instance;
  }

  Stream<User?> fetchUser() {
    return auth.authStateChanges();
  }

  User? getUser() {
    return auth.currentUser;
  }

  Future<void> signUp(
      Map<String, dynamic> userInfo, String email, String password) async {
    try {
      final docRef = await database.collection("userInfo").add(userInfo);
      await database
          .collection("userInfo")
          .doc(docRef.id)
          .update({'id': docRef.id});

      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      // print('Firebase Error: ${e.code} : ${e.message}');
      if (e.code == 'weak-password') {
        print('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The email is already used.');
      }
    } catch (e) {
      print('Firebase Error: ${e}');
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential credentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credentials);
      print("DSGAFGSDFGSDFGSDFGSDFGDSFGTQERJDFHLSKAJFHASKJDFH");
      return "Success";
    } on FirebaseException catch (e) {
      return ('Firebase Error: ${e.code} : ${e.message}');
      // if (e.code == 'user-not-found') {
      //   return ('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   return ('Wrong password provided for that user.');
      // }
    } catch (e) {
      return ('Firebase Error: ${e}');
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
