import 'package:flutter/material.dart';
import 'app/ui/screens/users_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "User List App",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{

      },
      theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.red
      ),
      home: UsersScreen(),
    );
  }
}
