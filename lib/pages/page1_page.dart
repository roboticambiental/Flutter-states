import 'package:estados/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UserCubit>().clearUser();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (BuildContext context, state) {
          if (state is UserActive) {
            return UserInformation(state.user);
          }
          //else if ( state is InitialUser ){
          else {
            return Center(
              child: Text('There is no user information'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final User user;

  const UserInformation(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Name: ${user.name}'),
          ),
          ListTile(
            title: Text('Age: ${user.age}'),
          ),
          ListTile(
            title: Text(
              'Professions: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          ...user.professions.map((profession) => ListTile(
                title: Text(profession),
              )),
        ],
      ),
    );
  }
}
