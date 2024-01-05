import 'package:flutter/material.dart';
import 'package:flutter_fresh/provider/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
      const Duration(seconds: 2), ((computationCount) => computationCount));
});

class Statescreen extends ConsumerStatefulWidget {
  const Statescreen({Key? key}) : super(key: key);

  @override
  ConsumerState<Statescreen> createState() => _StatescreenState();
}

class _StatescreenState extends ConsumerState<Statescreen> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);

    final countNotify = ref.watch(countNotifyProvider);

    final streamData = ref.watch(streamProvider);

    ref.listen(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Reached 10")));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("State Provider"),
        backgroundColor: Colors.lightGreenAccent,
        elevation: 10.0,
        shadowColor: Colors.greenAccent,
        leading:  IconButton(onPressed: (){ context.go('/'); }, icon: Icon(FontAwesomeIcons.arrowLeft)),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(counterProvider);
              },
              icon: const Icon(
                FontAwesomeIcons.arrowsRotate,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).update((state) => state + 1);
            ref.read(countNotifyProvider.notifier).add();
          },
          backgroundColor: Colors.lightGreenAccent,
          elevation: 10.0,
          child: const Icon(FontAwesomeIcons.plus)),
      body: Center(
        child: Column(
          children: [
            Text(
              '$count',
              style: const TextStyle(fontSize: 24.0),
            ),
            Text(countNotify.toString()),
            streamData.when(
                data: (data) {
                  return Center(
                    child: Text(data.toString()),
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
