import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_graphql/login.dart';
import 'home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'querymutation.dart';
import 'graphqlConf.dart';
import 'users.dart';
import 'dart:convert';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
QueryMutation addMutation = QueryMutation();

class Register extends StatefulWidget {
  createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final nameTextController = TextEditingController();

  Widget build(context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
                nameDetails(),
                spaces(),
                emailDetails(),
                spaces(),
                passwordDetails(),
                spaces(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: registerButton2(),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: loginButton(),
                    ),
                  ],
                ),
              ]))),
    );
  }

  Widget spaces() {
    return SizedBox(height: 10);
  }

  Widget nameDetails() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: nameTextController,
        decoration: InputDecoration(
          labelText: 'Full Name',
          hintText: 'Mojo Jojo',
          icon: new Icon(
            Icons.person,
            color: Color(0xFF102253),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name details';
          }
          return null;
        });
  }

  Widget emailDetails() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailTextController,
        decoration: InputDecoration(
          labelText: 'email',
          hintText: 'mojo@gmail.com',
          icon: new Icon(
            Icons.mail,
            color: Color(0xFF102253),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email address';
          }
          return null;
        });
  }

  Widget passwordDetails() {
    return TextFormField(
        obscureText: _obscureText,
        controller: passwordTextController,
        decoration: InputDecoration(
          labelText: 'password',
          hintText: 'password',
          icon: new Icon(
            Icons.lock,
            color: Color(0xFF102253),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        });
  }

  Widget registerButton2() {
    return Mutation(
      options: MutationOptions(
        document: gql(QueryMutation()
            .createUser), // this is the mutation string you just created
        // you can update the cache based on results
        update: (GraphQLDataProxy cache, QueryResult result) {
          return cache;
        },
        // or do something with the result.data on completion
        onCompleted: (dynamic resultData) {
          print(resultData);
        },
      ),
      builder: (
        RunMutation runMutation,
        QueryResult result,
      ) {
        return ElevatedButton(
          onPressed: () async {
            //    //will enable non-nullable here
            if (_formKey.currentState.validate()) {
              runMutation({
                "userData": {
                  "email": emailTextController.text,
                  "name": nameTextController.text,
                  "password": passwordTextController.text
                }
              });
            }
            print("$nameTextController.text");
            print("$emailTextController.text");
            print("$passwordTextController.text");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ));
          },
          child: Text('Register'),
        );
      },
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ));
      },
      child: Text('Login'),
    );
  }
}
