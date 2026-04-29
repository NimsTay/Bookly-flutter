import 'package:bookly/theme/theme_colors.dart';
import 'package:bookly/widgets/user_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> login() async {
    final loginUrl = Uri.parse('http://127.0.0.1:8000/userApp/login/');
    try {
      final response = await http.post(
        loginUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          loginMessage = "Success";
        });
        //store in secure phone memory
        await mobileStorage.write(
          key: 'accessToken',
          value: data['accessToken'],
        );
        await mobileStorage.write(
          key: 'refreshToken',
          value: data['refreshToken'],
        );
        Navigator.pushReplacementNamed(context, '/home');
      }
      //invalid login
      else if (response.statusCode == 401) {
        setState(() {
          loginMessage =
              "Invalid credentials. Please try again or create an account.";
        });
      } else if (response.statusCode == 500) {
        setState(() {
          loginMessage =
              "There was an issue in the backend. Please try again later.";
        });
      }
    } catch (e) {
      setState(() {
        loginMessage = "Something went wrong";
      });
      print('exception $e');
    }
  }

  //controllers to access text from input
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String loginMessage = "";
  final mobileStorage = FlutterSecureStorage();
  bool showFirstView = true;
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {}); // rebuild when focus changes
    });
    passFocusNode.addListener(() {
      setState(() {}); // rebuild when focus changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        backgroundColor: ThemeColors.yellow,
        child: Column(
          children: [
            Expanded(
              child: CupertinoSwitch(
                //the initial value
                value: showFirstView,
                //when changed update the flag value
                onChanged: (value) {
                  setState(() {
                    showFirstView = value;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              // color: Color.fromRGBO(100, 220,  45, 1),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    //make the col only take height of content instead whole height of container so the align at bottom works
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.handshake_outlined, size: 90, color: ThemeColors.purple,),
                      Text(
                        "Bookly",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.purple,
                        ),
                      ),
                      Text(
                        "Find local services easily",
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Color.fromRGBO(52, 19, 51, 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserInput(
                      controller: emailController,
                      placeholder: "Your Email",
                      focusNode: emailFocusNode,
                      icon: Icons.email,
                    ),
                    //empty gap between inputs
                    SizedBox(height: 16),
                    //password input
                    UserInput(
                      controller: passController,
                      focusNode: passFocusNode,
                      placeholder: 'Your Password',
                      icon: CupertinoIcons.lock,
                    ),
                    //spacer sized box
                    SizedBox(height: 16),
                    //login button
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColors.teal,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Login"),
                        onPressed: () async {
                          await login();
                        },
                      ),
                    ),
                    //spacer sized box
                    SizedBox(height: 12),
                    Text(loginMessage),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Don't have an account?"),
                  CupertinoButton(
                    color: ThemeColors.purple,
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/createAcct');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
