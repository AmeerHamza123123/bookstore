// import 'package:flutter/material.dart';
// ignore_for_file: unused_local_variable
import 'dart:convert';

import 'package:bookstore/constants/error-handling.dart';
import 'package:bookstore/constants/global_variable.dart';
import 'package:bookstore/constants/utils.dart';
import 'package:bookstore/features/home/screens/home_screen.dart';
import 'package:bookstore/models/user.dart';
import 'package:bookstore/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/jso';
class AuthService{
  //sign up user
    void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name
  })async{
    try{
      User user=User(
                      id:'',
                      name:name,
                      password:password,
                      address:'',
                      token:'',
                      type:'',
                      email:email                      
                      );
                      // var jsonUser = json.encode(user);
                      http.Response res=await http.post(Uri.parse('$uri/api/signup'),body:user.toJson(),
                      headers: <String,String>{
                        'content-type':'application/json;charset=UTF-8',
                      });
                      httpErrorHandle(response: res,
                       context: context,
                        onSuccess: (){
                            showSnackBar(context, 'Acount has been created! login with same credentials.');


                        },);
              }catch(e){
                showSnackBar(context, e.toString());
      // res.status()
    }}
  
    
    void signInUser({
      required BuildContext context,
      required String email,
      required String password, 
      })async{
      try{
                      // var jsonUser = json.encode(user);
                      http.Response res=await http.post(Uri.parse('$uri/api/signin'),body:jsonEncode(
                        {
                          "email":email,
                          "password":password
                        }
                      ),
                      headers: <String,String>{
                        'content-type':'application/json;charset=UTF-8',
                      });
                      print(res.body);
                      httpErrorHandle(response: res,
                       context: context,
                        onSuccess: () async{
                          SharedPreferences prefs=await SharedPreferences.getInstance();
                         Provider.of<UserProvider>(context,listen:false).setUser(res.body);
                          await prefs.setString("x-auth-token",jsonDecode(res.body)['token']);
                          Navigator.pushNamedAndRemoveUntil(
                                                      context, HomeScreen.routeName ,
                                                       (route) => false);
                        },);
              }catch(e){
                showSnackBar(context, e.toString());
  
            }
  }
  //get user data
  void getUserData(
     BuildContext context,
    
  )async{
    try{
      SharedPreferences prefs=await SharedPreferences.getInstance();
        String? token=prefs.getString('x-auth-token');
        if(token==null){
          prefs.setString('x-auth-token','');
        }
        var tokenRes=await http.post(
            Uri.parse('$uri/tokenIsValid'),
            headers: <String,String>{
              'Content_'
            }
        );
      // User user=User(
      //                 id:'',
      //                 name:name,
      //                 password:password,
      //                 address:'',
      //                 token:'',
      //                 type:'',
      //                 email:email                      
      //                 );
      //                 // var jsonUser = json.encode(user);
      //                 http.Response res=await http.post(Uri.parse('$uri/api/signup'),body:user.toJson(),
      //                 headers: <String,String>{
      //                   'content-type':'application/json;charset=UTF-8',
      //                 });
                      // httpErrorHandle(response: res,
                      //  context: context,
                      //   onSuccess: (){
                      //       showSnackBar(context, 'Acount has been created! login with same credentials.');


                      //   },);
              }catch(e){
                showSnackBar(context, e.toString());
      // res.status()
    
  
    
              }}}