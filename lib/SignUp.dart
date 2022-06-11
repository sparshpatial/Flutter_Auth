import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/HomePage.dart';
import 'package:flutter_catalog/LoginPage.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                Text("SignUp",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome ! Create your free account now.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  child: Image.asset(
                    "assets/images/Signup.png",
                    width: 250,
                    height: 250,
                  ),
                ),
                Container(
                  width: 370,
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                            15.0,
                          )))),
                ),
                SizedBox(height: 10),
                Container(
                  width: 370,
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(
                            15.0,
                          )))),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    setState(() {
                      changeButton = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton ? 50 : 150,
                    height: 40,
                    alignment: Alignment.center,
                    child: changeButton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text("SignUp",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 10)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(" Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                      style: TextButton.styleFrom(minimumSize: Size(20, 20)),
                    ),
                  ],
                ),
                Text(
                  "OR",
                  style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cloud,
                    color: Colors.amber,
                    size: 24.0,
                  ),
                  label: Text(
                    'SignIn with GOOGLE ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            )));
  }
}
