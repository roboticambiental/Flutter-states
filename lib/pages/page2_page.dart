import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return (state is! UserInitialState)
                ? Text('${state.user!.name}')
            : Text('Page 2');
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

                userBloc.add(ActivatedUser(user));
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
                userBloc.add(ChangeAge(34));
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
                userBloc.add(AddProfession());
              },
            ),
          ],
        ),
      ),
    );
  }
}
