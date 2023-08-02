import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _desitanationController = PageController(initialPage: 0, viewportFraction: 1 / 3);

  List<Map<String, String>> mainCarousel = [
    {
      "title": "Bali, Indonesia",
      "description": "Find your hotel easily and travel\nanywhere you want wits us.",
      "image": "",
      "visitLink": ""
    },
    {
      "title": "Bali, Indonesia",
      "description": "Find your hotel easily and travel\nanywhere you want wits us.",
      "image": "",
      "visitLink": ""
    },
    {
      "title": "Bali, Indonesia",
      "description": "Find your hotel easily and travel\nanywhere you want wits us.",
      "image": "",
      "visitLink": ""
    },
  ];

  List<Map<String, String>> categories = [
    {"name": "FLIGHT", "asset": "assets/flight.png"},
    {"name": "HOTELS", "asset": "assets/hotels.png"},
    {"name": "TRAINS", "asset": "assets/trains.png"},
    {"name": "BUS", "asset": "assets/bus.png"},
  ];

  List<Map<String, String>> destinations = [
    {"name": "Indonesia", "asset": ""},
    {"name": "Japan", "asset": ""},
    {"name": "Korea", "asset": ""},
    {"name": "Turkey", "asset": ""},
    {"name": "France", "asset": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: buildLogo(),
        actions: [
          buildPointsArea(),
        ],
      ),
      body: Column(
        children: [
          buildMainCarousel(),
          buildCategories(),
          buildPopularDestinations(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF0063A7),
          unselectedItemColor: const Color.fromARGB(255, 196, 196, 196),
          unselectedLabelStyle:
              GoogleFonts.poppins(color: const Color(0xFFC4C4C4), fontWeight: FontWeight.w500, fontSize: 10),
          selectedLabelStyle:
              GoogleFonts.poppins(color: const Color(0xFF0063A7), fontWeight: FontWeight.w500, fontSize: 10),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: "Booking"),
            BottomNavigationBarItem(icon: Icon(Icons.email_rounded), label: "Inbox"),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: "Account"),
          ]),
    );
  }

  Widget buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Image.asset(
              "assets/logo.png",
              height: 20,
              width: 18,
            ),
          ),
          Text(
            "Apic",
            style: GoogleFonts.poppins(fontSize: 16, color: const Color(0xFF0063A7)),
          ),
          Text(
            "Travel",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: const Color(0xFF0063A7)),
          ),
        ],
      ),
    );
  }

  Widget buildPointsArea() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Image.asset(
              "assets/dollar.png",
              width: 14,
              height: 14,
            ),
          ),
          Text(
            "100 Pts",
            style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xFF0063A7)),
          )
        ],
      ),
    );
  }

  Widget buildMainCarousel() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: PageView.builder(
          itemCount: 3,
          pageSnapping: true,
          itemBuilder: (context, pagePosition) {
            return Container(
              // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(images[pagePosition]))),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 47, 47, 47), Color.fromARGB(0, 47, 47, 47)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        mainCarousel[pagePosition]["title"] ?? "",
                        style: GoogleFonts.poppins(fontSize: 26, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        mainCarousel[pagePosition]["description"] ?? "",
                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FilledButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 255, 162, 22))),
                              child: Text(
                                "View Hotels",
                                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(mainCarousel.length, (index) {
                                return Container(
                                  margin: const EdgeInsets.all(3),
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: pagePosition == index
                                          ? const Color.fromARGB(255, 255, 162, 22)
                                          : Colors.grey.shade100,
                                      shape: BoxShape.circle),
                                );
                              })),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "All Categories",
                    style:
                        GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 10, color: const Color(0xFF0063A7)),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                categories.length,
                (index) => InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 36,
                            backgroundColor: Colors.white,
                            child: Image.asset(categories[index]["asset"] ?? ""),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              categories[index]["name"] ?? "",
                              style:
                                  GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }

  Widget buildPopularDestinations() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 27),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Destination",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
              ),
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      _desitanationController.animateToPage(_desitanationController.page!.toInt() - 1,
                          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                    },
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_left_rounded,
                        color: Color.fromARGB(255, 0, 100, 167),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      _desitanationController.animateToPage(_desitanationController.page!.toInt() + 1,
                          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                    },
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Color.fromARGB(255, 0, 100, 167),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
                height: 171,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _desitanationController,
                  itemCount: destinations.length,
                  padEnds: false,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Column(
                        children: [
                          Container(
                            width: 104,
                            height: 143,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 196, 196, 196),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: 18,
                              child: Center(
                                child: Text(
                                  destinations[index]["name"] ?? "",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
