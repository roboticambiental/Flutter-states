
import 'dart:async';

import '../models/user.dart';

class _UserService{

  User? _user;
  final StreamController<User> _userStreamController = StreamController<User>.broadcast();

  User? get user => this._user;
  bool get userExists => (this._user != null) ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user){
    this._user = user;
    this._userStreamController.add(user);
  }

  void changeAge(int age){
    if (this.userExists){
      this._user!.age = age;
      this._userStreamController.add(this._user!);
    }
  }

}

final userService = _UserService();