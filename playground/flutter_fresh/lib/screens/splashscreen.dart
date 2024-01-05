import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splashscreen extends StatefulWidget {

  
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => context.go('/intro'));
  }

  @override
  Widget build(BuildContext context) {

    
    return const Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(
          image: AssetImage(
            'assets/images/bentley_logo.png',
          ),
          width: 200,
        ),
        SizedBox(height: 20,),
        CircularProgressIndicator(color: Colors.blueAccent,)
      ])),
    );
  }
}
