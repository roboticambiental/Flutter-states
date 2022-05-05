part of 'user_bloc.dart';

@immutable
abstract class UserEvent{}

class ActivatedUser extends UserEvent{
  final User user;
  ActivatedUser(this.user);
}

class ChangeAge extends UserEvent{
  final int age;
  ChangeAge(this.age);
}

class AddProfession extends UserEvent{
}

class ClearUser extends UserEvent{
}