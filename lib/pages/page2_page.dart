import 'package:estados/models/user.dart';
import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.userExists
        ? Text('Name: ${userService.user!.name}')
        : Text('Page 2'),
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
                final newUser = User(name: 'Robert', age: 33, professions: professions);
                userService.user = newUser;

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
                userService.changeAge(34);
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
                userService.addProfession();
              },
            ),
          ],
        ),
      ),
    );
  }
}
