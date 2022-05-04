
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserService with ChangeNotifier {

  User? _user;

  User? get user => this._user;
  bool get userExists => (this._user != null) ? true : false;

  set user(User? user){
    this._user = user;
    notifyListeners();
  }

  void changeAge(int age){
    if (userExists) {
      this._user!.age = age;
      notifyListeners();
    }
  }

  void removeUser(){
    this._user = null;
    notifyListeners();
  }

  void addProfession(){
    if (userExists) {
      this._user!.professions.add(
          'Profession ${this._user!.professions.length + 1}');
      notifyListeners();
    }
  }

}