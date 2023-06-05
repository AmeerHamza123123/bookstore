// import 'package:flutter/material.dart';
import 'package:bookstore/constants/global_variable.dart';
import 'package:bookstore/models/user.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/jso';
class AuthService{
  //sign up user
  void signUpUser({
    required String email,
    required String password,
    required String name
  })async{
    try{
      User user = User(
                      id:'',
                      name:name,
                      password:password,
                      address:'',
                      token:'',
                      type:'',
                      email:''
                      );
                      http.post(Uri.parse('$uri/api/signup'),body:user.tojson(),);
              }catch(e){
      // res.status()
    }
  }
}