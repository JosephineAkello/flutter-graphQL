import 'package:flutter/material.dart';

class Login extends StatelessWidget{
   bool _obscureText = true;

Widget build(context){
  return SingleChildScrollView(
    child: Form(
      child: Container(
        padding: EdgeInsets.all(20.0),
      child: Column( 
      children: [
       emailDetails(),
       spaces(),
       passwordDetails(),
       spaces(),
       loginButton()

      ]
    ))),
  );
}

Widget spaces(){
  return SizedBox(
    height: 10
  );
}

Widget emailDetails(){
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

  );
}

Widget passwordDetails(){
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
          )

  );
  
}

Widget loginButton(){
  return RaisedButton(
    onPressed: (){},
    child: Text('Login'),
    color: Color(0xFF91A6E0),
  );
  
}

}