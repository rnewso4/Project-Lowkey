import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lowkey/analytics_page.dart';
import 'package:lowkey/components/logo_style.dart';
import 'package:lowkey/forgot_password.dart';
import 'package:lowkey/signup_page.dart';
import 'components/page_transition.dart';
import 'homepage_list.dart';

class Login extends StatefulWidget {
  const Login ({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void checkAccount() {
    myController.text == 'lowkey' 
    ? Navigator.push( context, SlideRightRoute(page: const AnalyticsPage()))
    : Navigator.push( context, SlideRightRoute(page: const HomepageList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topCenter,
              child: Image(
                height: 150,
                image: AssetImage('lib/assets/officiallogo.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 40),
              child: Text(
                'LOWKEY',
                style: loginLogo
              )
            ),
            Container(
              padding: const EdgeInsets.only(left: 50),
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to your Account', 
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w600
                )
              )
            ),
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.only(top: 20),
              child: const Material(
                elevation: 2,
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none
                    ),
                    labelText: 'Email',
                    hintText: 'tigers@lsu.edu',
                  ),
                  keyboardType: TextInputType.emailAddress,
                )
              )
            ),
            Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.only(top: 25),
              child: Material(
                elevation: 2,
                shadowColor: Colors.black,
                child: TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)), 
                      borderSide: BorderSide.none
                    ),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                )
              )
            ),
            GestureDetector(
              onTap: () => checkAccount(),
              child: Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)), 
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )
                  )
                )
              )
            ),
            GestureDetector(
              onTap: () => {Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Signup()))},
              child: Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all() 
                ),
                child: const Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )
                  )
                )
              )
            ),
            GestureDetector(
              onTap:  () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ForgotPassword()))
              },
              child: Container(
                padding: const EdgeInsets.only(top: 30, right: 50),
                alignment: Alignment.topRight,
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
            )
          ]
        )
      )
    );
  }
}


