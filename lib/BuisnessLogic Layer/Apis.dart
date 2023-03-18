import 'dart:convert';

import 'package:flutter/material.dart';

class Api {

  Future<void> PostData(String firstName, String lastName, String email,
      String password, String country) async {
    try {
      var http;
      final response = await http.post(
        Uri.parse('http://localhost:3000/smart-builders/UserSignUp'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "country": country,
        }),
      );
      debugPrint("Data is Sucessfully Inseted");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}