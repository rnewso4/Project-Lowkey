import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lowkey/components/logo_style.dart';
import 'package:lowkey/create_business_page.dart';
import 'package:lowkey/forgot_password.dart';
import 'components/page_transition.dart';
import 'homepage_list.dart';

final _formKey = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup ({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
          key: _formKey,
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
                  'Make an Account', 
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600
                  )
                )
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(top: 25),
                child: Material(
                  elevation: 2,
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide.none
                      ),
                      labelText: 'Name',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (name) => (name == null || name.isEmpty) ? 'Text is empty' : null
                  )
                )
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(top: 30),
                child: Material(
                  elevation: 2,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide.none
                      ),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) => !EmailValidator.validate(email!)
                    ? 'Not a valid email.'
                    : null,
                  )
                )
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                child: Material(
                  elevation: 2,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)), 
                        borderSide: BorderSide.none
                      ),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    validator: (password) => (password == null || password.isEmpty) ? 'Text is empty' : null
                  )
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(value: isChecked, onChanged: (bool? value) {
                    setState(() { isChecked = value!;});}),
                  const Text('Check for manager account')
                ],
              ),
              GestureDetector(
                onTap: () => nextPage(context, isChecked),
                child: Container(
                  height: 50,
                  width: 300,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)), 
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      'NEXT',
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
            ]
          ),
        )
      )
    );
  }
}

nextPage(BuildContext context, bool isChecked) {
  if (_formKey.currentState!.validate()) {
     isChecked ? Navigator.push( context, SlideRightRoute(page: const CreateBusiness())) 
  : Navigator.push(context, SlideRightRoute(page: const HomepageList()));
  }
}