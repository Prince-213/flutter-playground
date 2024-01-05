import 'package:flutter/material.dart';
import 'package:flutter_fresh/provider/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Futurescreen extends ConsumerStatefulWidget {
  const Futurescreen({Key? key}) : super(key: key);

  @override
  ConsumerState<Futurescreen> createState() => _FuturescreenState();
}

class _FuturescreenState extends ConsumerState<Futurescreen> {
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
        backgroundColor: Colors.lightBlueAccent,
        leading:  IconButton(onPressed: (){ context.go('/'); }, icon: Icon(FontAwesomeIcons.arrowLeft)) ,
      ),
      body: Column(
        children: [
          userData.when(data: (data) {
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  splashColor: Colors.lightGreenAccent.withOpacity(0.2),
                  child: ListTile(
                    title: Text("${data[index].firstname } ${data[index].lastname}"),
                    subtitle: Text(data[index].email),
                    leading: CircleAvatar(backgroundImage: NetworkImage(data[index].avatar),),
                  ),
                );
              }, itemCount: data.length,),
            );
          }, error: (error, stackTrace) {
            return Text(error.toString());
          }, loading: () {
            return const CircularProgressIndicator();
          })
        ],
      ),
    );
  }
}
