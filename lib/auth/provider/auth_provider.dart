import 'dart:math';

import 'package:eventlly/common/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  userLogin({required String email, required String password}) {
    try {
      FirebaseServices.logInUser(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    String errorMessage=  _getMessageFromErrorCode(e);
    } on FirebaseException catch (e) {
    } catch (e) {}
  }

  userSignUp({
    required String email,
    required String password,
    required String name,
  }) {
    try {
      FirebaseServices.registerUser(
        email: email,
        password: password,
        name: name,
      );
    } catch (e) {}
  }

  String _getMessageFromErrorCode(FirebaseAuthException e) {
    switch (e.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
      
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
     
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
       
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
       
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
       
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
        
      default:
        return "Login failed. Please try again.";
        
    }
  }
}
