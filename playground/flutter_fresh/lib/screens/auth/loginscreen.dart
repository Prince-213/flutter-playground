import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/bentley_logo.png'),
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Log in to your account using email or social networks",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Ionicons.mail_outline,
                              color: Colors.blueAccent,
                              size: 24,
                            ),
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black26
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            filled: true,
                            fillColor: Color(0xFFEEEFF8),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.blueAccent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.redAccent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Ionicons.lock_closed_outline,
                              color: Colors.blueAccent,
                              size: 24,
                            ),
                            suffixIcon: Icon(
                              Ionicons.eye_outline,
                              color: Colors.black12,
                              size: 24,
                            ),
                            hintText: 'Enter password',
                            hintStyle: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black26
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            filled: true,
                            fillColor: Color(0xFFEEEFF8),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.blueAccent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.redAccent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    context.go('/auth/forgot');
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.go('/home');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 67, 133, 249),
                                padding: const EdgeInsets.all(15),
                                minimumSize: const Size(double.infinity, 50),
                                maximumSize: const Size(double.infinity, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                elevation: 2,
                                shadowColor: Colors.lightBlueAccent),
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            )),

                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'First time?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                                onPressed: () {
                                  context.go('/auth/register');
                                },
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: const Text(
                                  'Sign up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  
  }
}
