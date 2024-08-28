import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_api/ui/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

@override
class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              width: 100.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        //komdisi bila username null
                        if (usernameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Username cannot be empty'),
                            ),
                          );
                        } else {
                          isSignedIn = true;
                        }

                        if (passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Password cannot be empty'),
                            ),
                          );
                        } else {
                          isSignedIn = true;
                        }

                        if (usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(
                                  username: usernameController.text,
                                  password: passwordController.text, firstname: '',
                                  )
                            ),
                            (route) => false,
                          );
                        }
                      },
                    );
                  },
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(5.0),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.blue,
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ButtonStyle(
                elevation: WidgetStatePropertyAll(5.0),
                backgroundColor: WidgetStatePropertyAll(
                  Colors.blue,
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
