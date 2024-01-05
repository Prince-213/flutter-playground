import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class Verify extends StatelessWidget {
Verify({ Key? key }) : super(key: key);

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Ionicons.chevron_back)),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    Text(
                      "Enter Verification Code",
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
                        "We have sent the code verification to your Email Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
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
                            hintText: 'Enter Verification Code',
                            hintStyle: TextStyle(
                                fontFamily: 'Quicksand', color: Colors.black26),
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
                          height: 30,
                        ),
                      
                        ElevatedButton(
                            onPressed: () {
                              context.go('/auth/regsuccess');
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
                              'Verify',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        
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