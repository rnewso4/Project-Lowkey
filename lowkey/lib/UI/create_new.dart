import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lowkey/UI/homepage_list.dart';

class CreateNew extends StatefulWidget {
  const CreateNew({Key? key}) : super(key: key);
  @override
  _CreateNewState createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
      //   title: const Text(
      //     'Create new advertisement!',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     )
      //   ),
      // ),
      body: Stack(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(5),
            child: 
              const Align(
                alignment: Alignment(-0.9, -0.8),
                child: Icon(Icons.arrow_back),
                ),
            onTap: () => Navigator.pop(context), 
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 500,
              width: 400,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 300,
                    margin: const EdgeInsets.all(10),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width: 60)),
                        labelText: 'Enter: whatever we enter here',
                      ),
                      keyboardType: TextInputType.text, //whatever this is supposed to be
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    margin: const EdgeInsets.all(10),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width: 60)),
                        labelText: 'Enter: whatever we enter here',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    height: 50, 
                    width: 300,
                    margin: const EdgeInsets.all(10),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width:100)),
                        labelText: 'Enter: whatever we enter here', 
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    height: 50, 
                    width: 300, 
                    margin: const EdgeInsets.all(10),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width: 60)),
                        labelText: 'Enter: whatever we enter here',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    margin: const EdgeInsets.all(10),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width: 60)),
                        labelText: 'Enter: whatever we enter here',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  InkWell(
                    onTap:() => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const HomepageList()) //change to whatever page its supposed to go to
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 30,
                      width: 200,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Colors.amber,
                            Colors.amber,
                          ]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: const Center(
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
        ] //children
      ),
    );
  }
}