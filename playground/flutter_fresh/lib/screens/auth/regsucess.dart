import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Regsucess extends StatelessWidget {
  const Regsucess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 350),
        child: Container(
          width: double.infinity,
      
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Great🎉',
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.blue,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "You have been registered successfully",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Welcome, don't worry, we'll let you know if there's a problem with your account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 180,),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/auth');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 67, 133, 249),
                          padding: const EdgeInsets.all(15),
                          minimumSize: const Size(double.infinity, 50),
                          maximumSize: const Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 2,
                          shadowColor: Colors.lightBlueAccent),
                      child: const Text(
                        'Back to Log in',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
