import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.username, this.password,  this.firstName, this.lastName, required String firstname});

  final String? username;
  final String? password;
  final String? firstName;
  final String? lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 100.0,
            ),
            Text(
              'Welcome $username!',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 18.0, letterSpacing: 2.0),
            ),
            Text(
              'Your password is $password',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 18.0, letterSpacing: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
