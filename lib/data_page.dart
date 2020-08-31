import 'package:SQLite/utils/Database.dart';
import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  Map<String, String> newUser = {};
  Future _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = getUser();
  }

  getUser() async {
    final _userData = await DBProvider.db.getUser();
    return _userData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _userFuture,
      builder: (_, userData) {
        switch (userData.connectionState) {
          case ConnectionState.none:
            return Container(child: Text('NO DATA'));
          case ConnectionState.waiting:
            return Container(
              child: Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator())),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (!newUser.containsKey('username')) {
              newUser = Map<String, String>.from(userData.data);
            }
            return Column(
              children: [Text(newUser['username']), Text(newUser['password'])],
            );
        }
        return Container();
      },
    );
  }
}
