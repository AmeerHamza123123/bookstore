import 'package:bookstore/common/widgets/custom_textfield.dart';
import 'package:bookstore/common/widgets/custombutton.dart';
import 'package:bookstore/constants/global_variable.dart';
import 'package:bookstore/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

enum Auth{
  signup,
  signin
}

class AuthScreen extends StatefulWidget {
  static const String routeName='/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
   Auth _auth = Auth.signup;
   final _signUpFormKey=GlobalKey<FormState>();
      final _signInFormKey=GlobalKey<FormState>();
      final AuthService authService=AuthService();
      final TextEditingController _emailController= TextEditingController();

      final TextEditingController _passwordController=TextEditingController();

      final TextEditingController _nameController=TextEditingController();


  void signUpUser(){
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,);
  }
   void signInUser(){
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text);
  }


  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
    body: SafeArea(child: Column(
      children: [
      const Text('welcome', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),

      ListTile(
        tileColor: _auth==Auth.signup? GlobalVariables.backgroundColor: GlobalVariables.greyBackgroundCOlor,
        title: const Text("create Acount" , style: TextStyle( fontWeight: FontWeight.bold),),
      leading: Radio(
        activeColor: GlobalVariables.secondaryColor,
        value: Auth.signup,
        groupValue: _auth,
        onChanged: (Auth? val){
          setState(() {
            _auth=val!;
          }); 
        },     
        
      ),),
      if(_auth==Auth.signup)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          color: GlobalVariables.backgroundColor,
          child: Form(
            key:_signUpFormKey,
            child: Column(
              children: [

                Customtextfield(
                  controller: _emailController,
                  hintText: "Email"
                  ),
        
        
                  const SizedBox(height: 20),
        
        
                  Customtextfield(
                  controller: _passwordController,
                  hintText: "password"
                  ),
        
        
                  const SizedBox(height: 20),
        
        
                  Customtextfield(  
                  controller: _nameController,
                  hintText: "name"
                  ),


                  const SizedBox(height: 20),

                  CustomButton(
                  text: "Sign Up",
                  onTap:(){
                    if(_signUpFormKey.currentState!.validate()){
                    signUpUser();
                    }

                  }
                  ),




              ],
            ),
          ),
        )
      
      ,
      ListTile(
        title: const Text("Sign-In." , style: TextStyle( fontWeight: FontWeight.bold),),
         tileColor: _auth==Auth.signin? GlobalVariables.backgroundColor: GlobalVariables.greyBackgroundCOlor,
      leading: Radio(
        activeColor: GlobalVariables.secondaryColor,
        value: Auth.signin,
        groupValue: _auth,
        onChanged: (Auth? val){
          setState(() {
            _auth=val!;
          });
        },
        
      ),
      ),
            if(_auth==Auth.signin)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          color: GlobalVariables.backgroundColor,
          child: Form(
            key:_signInFormKey,
            child: Column(
              children: [

                Customtextfield(
                  controller: _emailController,
                  hintText: "Email"
                  ),
        
        
                  const SizedBox(height: 20),
        
        
                  Customtextfield(
                  controller: _passwordController,
                  hintText: "password"
                  ),
        


                  const SizedBox(height: 20),

                  CustomButton(
                  text: "Sign In",
                  onTap:(){
                    if(_signInFormKey.currentState!.validate()){
                    signInUser();
                    }
                  }
                  ),




              ],
            ),
          ),
        )
      ],
    )),
    );
  }
}