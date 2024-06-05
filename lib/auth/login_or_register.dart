import 'package:flutter/material.dart';
import 'package:sizzling/pages/Login.dart';
import 'package:sizzling/pages/register.dart';

class LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegister();
}

class _LoginOrRegister  extends State<LoginOrRegister>{

  // initially show login page

  bool showLogin = true;

  // toggle b/w login  and register page

  void toggle(){
      setState((){
        showLogin = !showLogin;
  });
}
  @override
  Widget build(BuildContext context) {
    if(showLogin){
      return Login(onTap: toggle);
    }
    else{
      return Register(onTap: toggle);
    }
  }
}