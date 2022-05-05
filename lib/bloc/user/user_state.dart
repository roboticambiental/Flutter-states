part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool userExists;
  final User? user;

  UserState({
    required this.userExists,
    this.user,
  });
}

class UserInitialState extends UserState{
  UserInitialState() : super(userExists: false);
}

class UserSetState extends UserState{
  final User user;
  UserSetState({required this.user}) : super(userExists: true, user: user);

}
