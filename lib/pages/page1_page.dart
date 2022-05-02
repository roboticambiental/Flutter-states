import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot){
          //userService.userExists
          return snapshot.hasData
              //? UserInformation(userService.user!)
              ? UserInformation(snapshot.data!)
              : Center(child: Text('There is no user information'),
          );
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

  UserInformation(this.user);

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
          ListTile(
            title: Text('Profession 1'),
          ),
          ListTile(
            title: Text('Profession 1'),
          ),
          ListTile(
            title: Text('Profession 1'),
          ),
        ],
      ),
    );
  }
}
