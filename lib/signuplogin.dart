import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Signuplogin extends StatefulWidget {
  const Signuplogin({super.key});

  @override
  State<Signuplogin> createState() => _SignuploginState();
}

class _SignuploginState extends State<Signuplogin> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login(String email,password)async{
    try{
        Response response = await post(Uri.parse('https://reqres.in/api/register'),
        body: {
          'email' : email,
          'password' :password
            }
        );
        if(response.statusCode==200){
          var data = jsonDecode(response.body.toString());
          print(data['token']);
          print('Account created Successfully');
        }else{
          print('failed');

        }


    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Sign Up Api'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,

          children: [
            TextFormField(
              controller:emailController,
              decoration:InputDecoration(
                hintText:'Mail'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller:passwordController,
              decoration:InputDecoration(
                  hintText:'pass'
              ),
            ),
            SizedBox(height: 30,),

            GestureDetector(
              onTap:(){
                login(emailController.text.toString(),passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration:BoxDecoration(
                  color:Colors.green,
                  borderRadius:BorderRadius.circular(10)
              
                ),
                child:Center(child:Text('Sign Up'),),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
