import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:week9_authentication/api/firebase_auth_api.dart';
import 'package:week9_authentication/models/todo_model.dart';

class UserAuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;
  late Stream<User?> _userStream;

  Stream<User?> get userStream => _userStream;
  User? get user => authService.getUser();

  UserAuthProvider() {
    authService = FirebaseAuthAPI();
    fetchUser();
  }

  void fetchUser() {
    _userStream = authService.fetchUser();
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }

  Future<void> signUp(signUpInfo name, String email, String password) async {
    await authService.signUp(name.toJson(name), email, password);
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    await authService.signIn(email, password);
    notifyListeners();
  }
}
