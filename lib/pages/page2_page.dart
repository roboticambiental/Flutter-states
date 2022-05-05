import 'package:estados/bloc/user/user_cubit.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userCubit = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserCubit, UserState>(
          builder: (BuildContext context, state) {
            if (state is UserActive) {
              return Text('${state.user.name}');
            }
            //else if ( state is InitialUser ){
            else {
              return Text('Page 2');
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                'Establish user',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              onPressed: () {
                List<String> professions = List.empty(growable: true);
                professions.add('Engineer');

                final user =
                    User(name: 'Robert', age: 33, professions: professions);

                userCubit.selectUser(user);

              },
            ),
            MaterialButton(
              child: Text(
                'Change age',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              onPressed: () {
                userCubit.changeAge(34);
              },
            ),
            MaterialButton(
              child: Text(
                'Add profession',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              onPressed: () {
                userCubit.addProfession();
              },
            ),
          ],
        ),
      ),
    );
  }
}
