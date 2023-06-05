import 'package:bookstore/constants/global_variable.dart';
import 'package:bookstore/features/auth/screens/auth_screen.dart';
import 'package:bookstore/features/auth/services/auth_service.dart';
import 'package:bookstore/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/router.dart';
import 'package:provider/provider.dart';
 
void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>UserProvider(),),],child:const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService=AuthService();
  @override
  void initState() {
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      theme: ThemeData(       
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor
        ),


        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0
        )
        
        ,
        iconTheme: const IconThemeData(color: Colors.black)
      ),

      onGenerateRoute:(settings) => generateRoute(settings) ,
      home:const AuthScreen()


        


/* 
      home:  Scaffold(
        appBar: AppBar(
          title:const  Text("Book Store"),
        ),

        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),



            const Center(
               child: Text("hellow world"),
            ),



            const SizedBox(
              height: 60,
            ),



            Builder(
              builder: (context) {
                return ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, AuthScreen.routeName);
                }, child:const  Text("Click"),);
              }
            ),


            const SizedBox(
              height: 60,
            )
          ],
        ),*/
      );
      
      }
}
      