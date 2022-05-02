import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
