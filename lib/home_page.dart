import 'package:flutter/material.dart';
import './utils/Database.dart';
import './models/user.dart';

class HomePageForm extends StatefulWidget {
  @override
  _HomePageFormState createState() => _HomePageFormState();
}

class _HomePageFormState extends State<HomePageForm> {
  var username;
  var password;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  onSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(hintText: 'Username'),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  onSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(hintText: 'Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: IconButton(
                    splashColor: Colors.blue,
                    splashRadius: 20,
                    icon: Icon(Icons.android_sharp, size: 30),
                    onPressed: () {
                      var newUser =
                          User(username: username, password: password);
                      DBProvider.db.newUser(newUser);
                      FocusScope.of(context).unfocus();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
