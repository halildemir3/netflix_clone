import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:instagram_clone/list_item.dart';
import 'package:instagram_clone/slider_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Netflix clone",
      debugShowCheckedModeBanner: false,
      home: Netflix(),
    );
  }
}

class Netflix extends StatefulWidget {
  const Netflix({Key? key}) : super(key: key);

  @override
  _NetflixState createState() => _NetflixState();
}

class _NetflixState extends State<Netflix> {
  List<String> movieCarousselUrl = [
    "assets/charles.jpg",
    "assets/craig.jpg",
    "assets/lilartsy.jpg",
    "assets/pavel.jpg",
  ];
  List<String> movieTitle = [
    "Star Wars the Jedi Return",
    "JOKER",
    "Cursed",
    "Kimetsu no yaiba : Mugen Train"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        centerTitle: true,
        title: Text(
          "Netflix",
          style: TextStyle(
            color: Colors.red,
            fontSize: 26,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Movie & Series",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              CarouselSlider(
                items: [
                  sliderItem(movieCarousselUrl[0], movieTitle[0]),
                  sliderItem(movieCarousselUrl[1], movieTitle[1]),
                  sliderItem(movieCarousselUrl[2], movieTitle[2]),
                  sliderItem(movieCarousselUrl[3], movieTitle[3]),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  height: 280,
                ),
              ),
              Text(
                "Recomendation",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                height: 340,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    listItem(movieCarousselUrl[0], "Star Wars"),
                    listItem(movieCarousselUrl[1], "Cursed"),
                    listItem(movieCarousselUrl[2], "Joker"),
                    listItem(movieCarousselUrl[3], "Mulan"),
                  ],
                ),
              ),
              Container(
                height: 340,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    listItem(movieCarousselUrl[2], "Joker"),
                    listItem(movieCarousselUrl[3], "Mulan"),
                    listItem(movieCarousselUrl[0], "Star Wars"),
                    listItem(movieCarousselUrl[1], "Cursed"),
                    listItem(movieCarousselUrl[2], "Joker"),
                    listItem(movieCarousselUrl[3], "Mulan"),
                    listItem(movieCarousselUrl[0], "Star Wars"),
                    listItem(movieCarousselUrl[1], "Cursed"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color(0xff212121),
              title: Text("Home"),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Downloaded"), icon: Icon(Icons.file_download)),
          BottomNavigationBarItem(
              title: Text("PlayList"), icon: Icon(Icons.playlist_play)),
          BottomNavigationBarItem(
              title: Text("Account"), icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
