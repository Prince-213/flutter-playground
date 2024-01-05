import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:animations/animations.dart';

final pageProvider = StateProvider<int>((ref) {
  return 0;
});

class Introscreen extends ConsumerStatefulWidget {
  const Introscreen({Key? key}) : super(key: key);

  @override
  ConsumerState<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends ConsumerState<Introscreen> {
  @override
  Widget build(BuildContext context) {
    final PageController introPage = PageController(initialPage: 0);

    final pageStatus = ref.watch(pageProvider);

    final pages = [Page1(ref: ref), Page2(ref: ref,), Page3(context: context)];

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 140),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                width: pageStatus == 0 ? 60 : 6,
                height: 6,
                decoration: BoxDecoration(
                    color: pageStatus == 0
                        ? const Color(0xFF5080C3)
                        : Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 5,
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: pageStatus == 1 ? 60 : 6,
                height: 6,
                decoration: BoxDecoration(
                    color: pageStatus == 1
                        ? const Color(0xFF5080C3)
                        : Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 5,
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: pageStatus == 2 ? 60 : 6,
                height: 6,
                decoration: BoxDecoration(
                    color: pageStatus == 2
                        ? const Color(0xFF5080C3)
                        : Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: () {
                ref.read(pageProvider.notifier).update((state) => state = 2);
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ))
        ],
      ),
      body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (
            child,
            animation,
            secondaryAnimation,
          ) =>
              FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
          child: pages[pageStatus]),
    );
  }
}

class Page1 extends StatelessWidget {
  final ref;

  const Page1({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/images/sven-d-a4S6KUuLeoM-unsplash.jpg'),
              fit: BoxFit.cover)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Locate the Destination",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF5080C3),
                  fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Your destination is at your fingertips. Open our app & enter where you want to go",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w800,
                  color: Colors.black45,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(pageProvider.notifier).update((state) => state = 1);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B82C4),
                    padding: const EdgeInsets.all(20),
                    maximumSize: const Size(140, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 20,
                    shadowColor: Colors.lightBlueAccent),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Icon(
                      Ionicons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {

  final ref;
  const Page2({
    super.key,
    required this.ref
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/images/sven-d-a4S6KUuLeoM-unsplash.jpg'),
              fit: BoxFit.cover)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Your Route",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF5080C3),
                  fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Get quick access to freuent locations, and save them as a favourite",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w800,
                  color: Colors.black45,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(pageProvider.notifier).update((state) => state = 2);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B82C4),
                    padding: const EdgeInsets.all(20),
                    maximumSize: const Size(140, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 20,
                    shadowColor: Colors.lightBlueAccent),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Icon(
                      Ionicons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {

  final BuildContext context;

  const Page3({
    super.key, required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/images/sven-d-a4S6KUuLeoM-unsplash.jpg'),
              fit: BoxFit.cover)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get Your Car",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF5080C3),
                  fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Fastest way to book without the hassle of waiting & hanging for price",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w800,
                  color: Colors.black45,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go('/auth');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B82C4),
                    padding: const EdgeInsets.all(20),
                    maximumSize: const Size(180, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 20,
                    shadowColor: Colors.lightBlueAccent),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Icon(
                      Ionicons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
