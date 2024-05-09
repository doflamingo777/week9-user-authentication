/*
  Created by: Claizel Coubeili Cepe
  Date: updated April 26, 2023
  Description: Sample todo app with Firebase 
*/
import 'dart:convert';

class Todo {
  final int userId;
  String? id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    this.id,
    required this.title,
    required this.completed,
  });

  // Factory constructor to instantiate object from json format
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  static List<Todo> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Todo>((dynamic d) => Todo.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Todo todo) {
    return {
      'userId': todo.userId,
      'title': todo.title,
      'completed': todo.completed,
    };
  }
}

class signUpInfo {
  String? id;
  String firstname;
  String lastname;
  String email;

  signUpInfo(
      {this.id,
      required this.firstname,
      required this.lastname,
      required this.email});

  factory signUpInfo.fromJson(Map<String, dynamic> json) {
    return signUpInfo(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
    );
  }

  static List<signUpInfo> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<signUpInfo>((dynamic d) => signUpInfo.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(signUpInfo signUpInfo) {
    return {
      'id': signUpInfo.id,
      'firstname': signUpInfo.firstname,
      'lastname': signUpInfo.lastname,
      'email': signUpInfo.email
    };
  }
}
