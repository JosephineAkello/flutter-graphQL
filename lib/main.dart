import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GraphQL App',
      theme: ThemeData(
        primaryColor: Color(0xFF102253),
        accentColor: Color(0xFF91A6E0),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter GraphQL App',
        ),
        centerTitle: true,),
        body: Login(),));
  }
}

