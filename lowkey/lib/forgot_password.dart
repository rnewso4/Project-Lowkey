import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  void _submitCommand() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      showNotification();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 40, left: 5),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios))),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'Forgot Password',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 32))),
          Container(
            margin: const EdgeInsets.only(top: 80, left: 20),
            child: Text(
              'Please, enter your email address. You will receive a link to create a new password via email.',
              style: GoogleFonts.poppins(fontSize: 14))),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 50,
              width: 350,
              margin: const EdgeInsets.only(top: 30),
              child: Material(
                elevation: 2,
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (email) => !EmailValidator.validate(email!)
                    ? 'Not a valid email.'
                    : null,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide.none),
                      labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress))))),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () => _submitCommand(),
              child: Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.only(top: 100),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)), 
                  color: Colors.black),
                child: const Center(
                  child: Text(
                    'SEND',
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
          ),
        ],
      ),
    );
  }
}

showNotification () {
  return showSimpleNotification(
    const Text("Email Notification Sent!"),
    background: const Color(0xffE6E6E6),
    trailing: Builder(builder: (context) {
      return TextButton( onPressed: () => OverlaySupportEntry.of(context)?.dismiss(),
      child: const Text('Dismiss', style: TextStyle(color: Colors.black)));
    }),
  );
}