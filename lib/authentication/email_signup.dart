import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'email_login.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
  FirebaseDatabase.instance.reference().child("Users");
  bool isLoading = false, _hidden=false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xfff4f0fb),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Hero(
                tag: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/food.png'),
                  ),
                ),
              ),
            ),
            Container(
              // for blurring
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 90.0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 80.0),
                        width: MediaQuery.of(context).size.width / 1.25,
                        height: MediaQuery.of(context).size.height / 1.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 15,
                                            offset: Offset(0,
                                                4), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                        Container(
                                        height: 100,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: Colors.orange[500],
                                        ),
                                      ),
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              child: Text(
                                                'Go back, Log In',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),style:ButtonStyle()
                                              ,onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => EmailLogIn()),
                                              );
                                            },

                                            ),
                                        ],
                                      ),
                                    ),
                                    ],
                                  ),
                                ),
                                ),
                                ),
                              ],
                            ),
                            Form(
                                key: _formKey,
                                child: SingleChildScrollView(
                                    child: Column(children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                                        child: TextFormField(
                                          controller: name,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: "Enter User Name",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter User Name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                                        child: TextFormField(
                                          controller: email,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: "Enter Email Address",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),

                                          ),
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter an Email Address';
                                            } else if (!value.contains('@')) {
                                              return 'Please enter a valid email address';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                                        child: TextFormField(
                                          controller: phone,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: "Enter Phone Number",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter Phone Number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                                        child: TextFormField(
                                          obscureText: _hidden,
                                          controller: password,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                            labelText: "Enter Password",

                                            suffixIcon: IconButton(
                                                icon: Icon(_hidden?Icons.visibility_off:Icons.visibility,),
                                                onPressed: () {
                                                  setState((){_hidden=!_hidden;});
                                                }//write the function of the password field
                                            ),
                                          ),
                                          // The validator receives the text that the user has entered.
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter Password';
                                            } else if (value.length < 6) {
                                              return 'Password must be at least 6 characters!';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(30.0),
                                        child: isLoading
                                            ? CircularProgressIndicator()
                                            : ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(30.0),
                                                ),
                                                primary: Colors.deepPurple,
                                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                textStyle: TextStyle(
                                                fontSize: 20,
                                                ),
                                                ),
                                                    onPressed: () {
                                                  if (_formKey.currentState!.validate()) {
                                                      setState(() {
                                                      isLoading = true;
                                                                  },
                                                              );
                                                  registerToFb();
                                                  }
                                                  },
                                              child: Text('Sign Up!',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                        ),
                                      )
                                    ]
                                    )
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]
      ),
    );
  }


  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
        email: email.text, password: password.text)
        .then((result) {
      dbRef.child(result.user!.uid).set({
        "email": email.text,
        "phone": phone.text,
        "name": name.text
      }).then((res) {
        isLoading = false;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Registered"),
                content: Text("Congratulations, you have been successfully registered!"),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmailLogIn()),
                      );
                    },
                  )
                ],
              );
            });
      });
    }).catchError((err) {
      isLoading = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
  }
}