import 'dart:convert';
import 'package:access_restapi/users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //import package

class DataFromAPI extends StatefulWidget {
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  get user => null;
  late List<Users> _data;


  //get data
  Future getUserData() async {
    //https://jsonplaceholder.typicode.com/users
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));

    setState(() {
      List res = json.decode(response.body);
      _data = res.map((data) => Users.fromJsonMap(data)).toList();
    });
    return "success";

  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('USERS'),
        ),
        body: ListView.builder(
            itemCount: _data == null ? 0 : _data.length,
            itemBuilder: (context, index) {
              final item = _data[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.cyan,
                ),
                title: Text(item.name),
                subtitle: Text(item.username),
                trailing: Text(item.email),
                isThreeLine: true,
              );
            }));
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('User Data'),
  //     ),
  //     body: Container(
  //       child: Card(
  //         child: FutureBuilder(
  //           future: getUserData(),
  //           builder: (context, snapshot) {
  //             if (snapshot.data == null) {
  //               return Container(
  //                 child: Center(
  //                   child: Text('Loading...'),
  //                 ),
  //               );
  //             } else
  //               return ListView.builder(
  //                   itemCount: snapshot.data.length,
  //                   itemBuilder: (context, i) {
  //                     return ListTile(
  //                       title: Text(snapshot.data[i].name),
  //                       subtitle: Text(snapshot.data[i].username),
  //                       trailing: Text(snapshot.data[i].email),
  //                     );
  //                   });
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
//Create class User

class User {
  final String name, email, username;

  User(this.name, this.email, this.username);
}

class APIS {
  static final String _baseUrl = "https://jsonplaceholder.typicode.com";

  static var usersList = "$_baseUrl/users";
}
