import 'package:flutter/material.dart';
import 'package:project_api/model/users.dart';
import 'package:project_api/service/api_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen(
      {super.key,
      this.username,
      this.password,
      this.firstName,
      this.lastName,
      required String firstname});

  final String? username;
  final String? password;
  final String? firstName;
  final String? lastName;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<List<Users>?> users = ApiService().getUsers();

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
              'Welcome ${widget.username}!',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 18.0, letterSpacing: 2.0),
            ),
            Text(
              'Your password is ${widget.password}',
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 18.0, letterSpacing: 2.0),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FutureBuilder<List<Users>?>(
                  future: users,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text('Users not found'),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                            itemBuilder: (BuildContext context,int index) {},
                            itemCount: snapshot.data!.length,
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
