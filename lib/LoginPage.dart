import 'package:flutter/material.dart';
import 'package:flutter_catalog/HomePage.dart';
import 'package:flutter_catalog/SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Login to your account",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              width: 370,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                      ),
                                      hintText: "Enter username",
                                      labelText: "Username",
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                      ))),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: 370,
                              child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.password,
                                        color: Colors.blue,
                                      ),
                                      hintText: "Enter Password",
                                      labelText: "Password",
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0),
                                      ))),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  changeButton = true;
                                });
                                await Future.delayed(Duration(seconds: 1));
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
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
                                    : Text("Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(
                                        changeButton ? 50 : 10)),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text(" Sign up",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  )),
                              style: TextButton.styleFrom(
                                  minimumSize: Size(20, 20)),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 100),
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/login.png"),
                                fit: BoxFit.fitHeight),
                          ),
                        )
                      ],
                    ),
                  )
                ])));
  }
}
