import 'package:flutter/material.dart';
import 'package:flutter_fresh/provider/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Searchscreen extends ConsumerStatefulWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  ConsumerState<Searchscreen> createState() => _FuturescreenState();
}

class _FuturescreenState extends ConsumerState<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
        backgroundColor: Colors.lightBlueAccent,
        leading:  IconButton(onPressed: (){ context.go('/'); }, icon: Icon(FontAwesomeIcons.arrowLeft)) ,
      ),
      body: const Column(
        children: [
          
        ],
      ),
    );
  }
}
