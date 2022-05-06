import 'package:estados/controllers/user_controller.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Arguments: ${Get.arguments}');
    // Obtener la instancia del userController:
    var userCtrl = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Obx(
                () => userCtrl.userExists.value
                    ? Text('${userCtrl.user.value.name}')
                    : Text('Page 2')
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
                userCtrl.loadUser(user);
                Get.snackbar(
                  'User established',
                  'Name: ${user.name}',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    const BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                    )
                  ],
                  snackPosition: SnackPosition.BOTTOM,
                );
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
                userCtrl.changeAge(34);
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
                userCtrl.addProfession();
              },
            ),
            MaterialButton(
              child: const Text(
                'Change theme',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
            ),
          ],
        ),
      ),
    );
  }
}
