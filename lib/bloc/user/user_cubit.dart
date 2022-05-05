import 'package:estados/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  UserCubit() : super(InitialUser());

  void selectUser(User user){
    emit(UserActive(user));
  }

  void changeAge(int age){
    final currentState = state;
    if (currentState is UserActive){
      final newUser = currentState.user.copyWith(age: age);
      emit(UserActive(newUser));
    }
  }

  void addProfession(){
    final currentState = state;
    if (currentState is UserActive){
      final List<String> professions = currentState.user.professions;
      professions.add('Profession ${professions.length}');
      final newUser = currentState.user.copyWith(professions: professions);
      emit(UserActive(newUser));
    }
  }

  void clearUser(){
    emit(InitialUser());
  }

}