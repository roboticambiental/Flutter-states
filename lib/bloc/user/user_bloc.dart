import 'package:estados/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState>{

  UserBloc() : super( UserInitialState()){

    on<ActivatedUser>((event, emit) {
      //print('ActivatedUser called');
      emit(UserSetState(user: event.user));
    });

    on<ChangeAge>((event, emit) {
      if (!state.userExists) return;
      emit(UserSetState(user: state.user!.copyWith(age: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (state is UserInitialState){
        print('is initial state');
        return;
      }
      //if (!state.userExists) return;
      var professions = state.user!.professions;
      professions.add('Profession ${professions.length}');
      emit(UserSetState(user: state.user!.copyWith(professions: professions)));
    });

    on<ClearUser>((event, emit){
      emit(UserInitialState());
    });

  }

}