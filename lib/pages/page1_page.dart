import 'package:estados/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inyección de dependencia:
    final userCtrl = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
            onPressed: () => userCtrl.clearUser(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Obx(() => userCtrl.userExists.value
          ? UserInformation(user: userCtrl.user.value)
          : NoInfo()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        //onPressed: () => Navigator.pushNamed(context, 'page2'),
        onPressed: () => Get.toNamed('/page2', arguments: {
          'name': 'Bob',
          'age': 33,
        }),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('There is no user selected'),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final User user;

  const UserInformation({Key? key, required this.user}) : super(key: key);

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
                title: Text('${profession}'),
              )),
        ],
      ),
    );
  }
}
