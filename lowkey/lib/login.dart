import 'package:flutter/material.dart';
import 'homepage_list.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: <Color>[
                  Colors.white,
                  Color(0xffE66B63)
                ],
            )
            )
          ),
          const SizedBox(
            height: 350,
            width: 400,
            child: Center(
              child: Image(
                height: 250,
                image: AssetImage('lib/assets/logo.png')),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffF4F4F4),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60.0),
                  topLeft: Radius.circular(60.0)),
              ),
              height: 500,
              width: 400,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      top: 40
                    ),
                    child: const Text(
                      'LOWKEY',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'arial',
                      )
                      ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10
                    ),
                    child: const Text(
                      'Please login to continue',
                      style: TextStyle(
                        color: Color(0xff848484)
                      )
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    margin: const EdgeInsets.only(top: 50),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        labelText: 'Email',
                        hintText: 'tigers@lsu.edu'
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    margin: const EdgeInsets.only(top: 30),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    alignment: const Alignment(1.0, 0.0),
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(right: 45),
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: Color(0xffE66B63),
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      )
                      ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomepageList())
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 30),
                      height: 40,
                      width: 150,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color(0xffFFBAB5),
                            Color(0xffE66B63)
                          ],
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: const Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        )
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Don\'t have an account? '),
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xffE66B63),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}