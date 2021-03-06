import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'home.dart';
import 'querymutation.dart';

QueryMutation queryMutation = QueryMutation();

class Login extends StatefulWidget {
  createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final emailLoginTextController = TextEditingController();
  final passwordLoginTextController = TextEditingController();

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
                    emailDetails(),
                    spaces(),
                    passwordDetails(),
                    spaces(),
                    loginButton(),
                  ]))),
        ));
  }

  Widget spaces() {
    return SizedBox(height: 10);
  }

  Widget emailDetails() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailLoginTextController,
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
        controller: passwordLoginTextController,
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
            //   return ElevatedButton(
            // onPressed: () async {
            //   //will enable non-nullable here
            //   if (_formKey.currentState.validate()) {
            //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //         backgroundColor: Color(0xFF9DACD4),
            //         content: Text('Processing')));
       return  Mutation(
        options: MutationOptions(
          document: gql(QueryMutation().loginUser),
         update: (GraphQLDataProxy cache, QueryResult result) {
          return cache;
         },
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
            if(_formKey.currentState.validate()){
              runMutation({
                "userData" : {
                   "email": emailLoginTextController.text,
                   "password": passwordLoginTextController.text
                   }
              });
            }
          print('$emailLoginTextController.text');
          print('$passwordLoginTextController.text');
          Navigator.push(context, 
           MaterialPageRoute(builder: (context) => Home()));
            },
              child: Text('Login'),
          );
        });
  
}
}