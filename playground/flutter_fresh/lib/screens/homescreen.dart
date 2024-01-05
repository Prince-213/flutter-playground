import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fresh/provider/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen_bottom_navigation_bar.dart';
import 'package:ionicons/ionicons.dart';

final List<String> logos = [
  'tesla_log.png',
  'toyota_logo.png',
  'lexus_logo.png',
  'ford_logo.png',
  'chevrolet_logo.png',
  'bmw_logo.png',
  'benz_logo.png',
  'bentley_logo.png',
  'audi_logo.png',
  'accura_logo.png',
];

final List<Map<String, dynamic>> vehicles = [
  {'image': 'abenz.png', 'name': 'Mercedes Benz Coupe', 'price': 1500},
  {'image': 'gwagon.png', 'name': 'Mercedes Gwagon', 'price': 1500},
  {'image': 'acovete.png', 'name': 'Corvette', 'price': 1500},
  {'image': 'bbentley.png', 'name': 'Bentley Continental', 'price': 1500},
  {'image': 'bbmw.png', 'name': 'BMW', 'price': 1500},
  {'image': 'bford.png', 'name': 'Ford Jeep', 'price': 1500},
  {'image': 'btoyota.png', 'name': 'Toyota Hilux', 'price': 1500},
  {'image': 'raudi.png', 'name': 'Audi', 'price': 1500},
  {'image': 'rtesla.png', 'name': 'Tesla', 'price': 1500},
  {'image': 'ycovete.png', 'name': 'Covette', 'price': 1500},
];

final hideProvider = StateProvider<bool>((ref) {
  return true;
});

final sliderProvider = StateProvider<double>((ref) {
  return 5;
});

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
    final theme = ref.watch(themeProvider);
    final height = MediaQuery.of(context).size.height;

    final hide = ref.watch(hideProvider);

    final slider = ref.watch(sliderProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 243, 248),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomAppBar(
        height: 130,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 20,
        shadowColor: Colors.black,
        child: Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: slider,
            child: Container(
              width: 40,
              height: 5,
              decoration: const BoxDecoration(
                  color: Color(0xFF3083FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.55),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      ref
                          .read(sliderProvider.notifier)
                          .update((state) => state = 5);
                    },
                    icon: slider == 5
                        ? Icon(
                            Ionicons.compass,
                            color: Colors.blueAccent,
                            size: 32,
                          )
                        : Icon(
                            Ionicons.compass_outline,
                            color: Colors.black26,
                            size: 32,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref
                          .read(sliderProvider.notifier)
                          .update((state) => state = 88);
                    },
                    icon: slider == 88
                        ? Icon(
                            Ionicons.heart,
                            color: Colors.blueAccent,
                            size: 32,
                          )
                        : Icon(
                            Ionicons.heart_outline,
                            color: Colors.black26,
                            size: 32,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref
                          .read(sliderProvider.notifier)
                          .update((state) => state = 171);
                    },
                    icon: slider == 171
                        ? Icon(
                            Ionicons.notifications,
                            color: Colors.blueAccent,
                            size: 32,
                          )
                        : Icon(
                            Ionicons.notifications_outline,
                            color: Colors.black26,
                            size: 32,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref
                          .read(sliderProvider.notifier)
                          .update((state) => state = 253);
                    },
                    icon: slider == 253
                        ? Icon(
                            Ionicons.person,
                            color: Colors.blueAccent,
                            size: 32,
                          )
                        : Icon(
                            Ionicons.person_outline,
                            color: Colors.black26,
                            size: 32,
                          ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 80,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              forceMaterialTransparency: true,
              foregroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                title: const Text(
                  "Your Location",
                  style: TextStyle(color: Colors.black38, fontSize: 14),
                ),
                subtitle: const Text(
                  "Ngangklik, Sleman",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                leading: IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.mapLocationDot,
                      size: 18,
                      color: Colors.black26,
                    ),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(45, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
                trailing: Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(image: AssetImage('assets/images/christopher-campbell-rDEOVtE7vOs-unsplash.jpg'), fit: BoxFit.cover)
                    ),
                  )
              ),
            ),
            SliverAppBar(
              collapsedHeight: 80,
              expandedHeight: 100,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Visibility(
                  visible: hide,
                  child: const SearchBar(
                    leading: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        weight: 0.2,
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    overlayColor: MaterialStatePropertyAll(Colors.white),
                    surfaceTintColor: MaterialStatePropertyAll(Colors.white),
                    shadowColor: MaterialStatePropertyAll(Colors.black12),
                    hintText: "Search Vehicle...",
                    hintStyle: MaterialStatePropertyAll(
                        TextStyle(color: Colors.black12)),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                width: double.infinity,
                height: height - 260,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Top brands",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.lightBlueAccent),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Flexible(
                          flex: 2,
                          child: CustomScrollView(
                            scrollDirection: Axis.horizontal,
                            slivers: [
                              SliverList.builder(
                                  itemCount: logos.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {},
                                                style: OutlinedButton.styleFrom(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    minimumSize:
                                                        const Size(100, 80),
                                                    maximumSize:
                                                        const Size(100, 80),
                                                    fixedSize:
                                                        const Size(100, 80),
                                                    side: const BorderSide(
                                                        color: Colors.black12)),
                                                child: Image.asset(
                                                  'assets/images/${logos[index]}',
                                                  width: 50,
                                                  height: 50,
                                                )),
                                            SizedBox(
                                              width: index == logos.length - 1
                                                  ? 0
                                                  : 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  })
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Available Near You",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.lightBlueAccent),
                              ))
                        ],
                      ),
                      Flexible(
                          flex: 4,
                          child: CustomScrollView(
                            scrollDirection: Axis.horizontal,
                            slivers: [
                              SliverList.builder(
                                  itemCount: vehicles.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder:
                                                          (BuildContext bc) {
                                                        return BottomDisplay(
                                                            height: height);
                                                      });
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            11),
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                    side: const BorderSide(
                                                        color: Colors.black12)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 210,
                                                      height: 150,
                                                      decoration: const BoxDecoration(
                                                          color:
                                                              Color(0xFFF7F7FB),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: Image.asset(
                                                          'assets/images/${vehicles[index]['image']}'),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${vehicles[index]['name']}',
                                                          softWrap: true,
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const SizedBox(height: 10,),
                                                        Container(
                                                          width: 200,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              
                                                              const Row(
                                                                children: [
                                                                  Icon(
                                                                    Ionicons
                                                                        .star,
                                                                    color: Colors
                                                                        .amber,
                                                                    size: 14,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            2,
                                                                      ),
                                                                      Text(
                                                                        '4.8',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              Text(
                                                                '💲${vehicles[index]['price']}',
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                            const SizedBox(
                                              width: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  })
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}

class BottomDisplay extends StatelessWidget {
  const BottomDisplay({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        height: height - 50,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Column(
            children: [
              Container(
                width: 70,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 250,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(134, 247, 247, 251),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Image.asset('assets/images/${vehicles[0]['image']}'),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Text(
                        '${vehicles[0]['name']}',
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6,),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.all(0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Ionicons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            
                          ],
                        ),
                      )
                    ],
                  ),

                  const Icon(Ionicons.heart_outline, size: 32, color: Colors.black12,)
                ],
              ),

              const SizedBox(height: 25,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(width: 1, color: Color.fromARGB(14, 0, 0, 0)), bottom: BorderSide(width: 1, color: Color.fromARGB(14, 0, 0, 0)))
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Container(
                    width: 60,
                    height: 80,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(image: AssetImage('assets/images/christopher-campbell-rDEOVtE7vOs-unsplash.jpg'), fit: BoxFit.cover)
                    ),
                  )
                ),
              )
            
            ],
          ),
        ),
      ),
    ]);
  }
}
