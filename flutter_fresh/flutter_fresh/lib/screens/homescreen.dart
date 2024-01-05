import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fresh/equatable/user.dart';
import 'package:flutter_fresh/provider/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  void initState() {
    super.initState();

    final name = ref.read(nameProvider('Princo'));

    if (kDebugMode) {
      print(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider("Princo"));
    final theme = ref.watch(themeProvider);
    final userInfo = ref
        .watch(infoProvider(const User(name: "Prince", address: "Ney York")));
    
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 50,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).update((state) => !state);
              },
              icon: theme
                  ? const Icon(
                      FontAwesomeIcons.sun,
                      color: Colors.white,
                    )
                  : const Icon(
                      FontAwesomeIcons.moon,
                      color: Colors.white,
                    ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Home $userInfo"),
            ElevatedButton(
                onPressed: () {
                  context.go('/state');
                },
                child: Text("Go To State Screen")),
            ElevatedButton(
                onPressed: () {
                  context.go('/future');
                },
                child: Text("Future Provider Screen")),
            ElevatedButton(
                onPressed: () {
                  context.go('/search');
                },
                child: Text("Search Filter Screen")),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    onSubmitted: (value) => ref.read(userProvider.notifier).updateName(value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(user.name)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
