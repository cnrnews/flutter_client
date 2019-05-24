import 'package:flutter/material.dart';
import 'package:app/home.dart';
import 'package:app/utils/utils.dart';

//登录
class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final registerFormState = new GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;
  void submitRegisterFormState(BuildContext context) {
    if (registerFormState.currentState.validate()) {
      registerFormState.currentState.save();
      debugPrint('username:$username');
      debugPrint('username:$password');
      new Utils().pushOtherPage(context, BottomNavagationBarWidget());
    } else {
      autovalidate = true;
    }
  }
  String validateUserName(value) {
    if (value.isEmpty) {
      return 'username is required';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:    Form(
            key: registerFormState,
            autovalidate: autovalidate,
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'userName',
                          // icon: Icon(Icons.subject),
                          hintText: 'Enter your name',
                          // border: OutlineInputBorder(),
                          filled: true,
                          helperText: '',
                          border: InputBorder.none),
                      onSaved: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      validator: validateUserName,
                    ),
                    TextFormField(
                      autocorrect: true,
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: 'password',
                          // icon: Icon(Icons.panorama),
                          hintText: 'Enter your password',
                          // border: OutlineInputBorder(),
                          filled: true,
                          helperText: '',
                          border: InputBorder.none),
                      validator: validatePassword,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          'register',
                          style: TextStyle(color: Colors.white),
                        ),
                        elevation: 0,
                        onPressed: () {
                          submitRegisterFormState(context);
                        },
                      ),
                    )
                  ],
                )),
            
    ));
  }
}
