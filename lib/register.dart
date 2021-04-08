import 'package:flutter/material.dart';
import 'home.dart';

class Register extends StatefulWidget {
  createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter GraphQL App',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
                    loginButton()
                  ]))),
        ));
  }

  Widget spaces() {
    return SizedBox(height: 10);
  }

  Widget nameDetails() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Full Name',
          hintText: 'Mojo Jojo',
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
            return 'Please enter your name details';
          }
          return null;
        });
  }

  Widget emailDetails() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
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

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        //will enable non-nullable here
        if (_formKey.currentState.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Color(0xFF9DACD4), content: Text('Processing')));

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ));
        }
      },
      child: Text('Register'),
    );
  }
}
