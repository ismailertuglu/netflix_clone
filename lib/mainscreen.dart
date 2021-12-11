import 'package:flutter/material.dart';
import 'package:netflix_clone/Constants/constants.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _scrollController = ScrollController();
  double _opacity = 0;
  final double start = 0;
  List<String> list = [];
  @override
  void initState() {
    // TODO: implement initState
    _scrollController
      ..addListener(() {
        if (_scrollController.position.pixels >= 0 &&
            _scrollController.position.pixels < 15) {
          double num = double.parse(
              (_scrollController.position.pixels).toStringAsFixed(2));
          setState(() {
            num <= .0
                ? _opacity = num
                : _opacity = _scrollController.position.pixels / 26;
          });
          print("Opacity : ${_opacity}");
          print("Position : ${_scrollController.position.pixels}");
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_opacity);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(_opacity),
        elevation: 0,
        actions: [
          Title(
            color: Colors.white,
            child: Text("TV Shows"),
          ),
          Title(
            color: Colors.white,
            child: Text("Movies"),
          ),
          Title(
            color: Colors.white,
            child: Text("Categories"),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: ListView(
        shrinkWrap: true,
        controller: _scrollController,
        padding: EdgeInsets.only(top: 0),
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                mainPoster(width: _width, height: _height),
                continueText(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ContinueWatchingSeries(),
                      ContinueWatchingSeries(),
                      ContinueWatchingSeries(),
                      ContinueWatchingSeries(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ContinueWatchingSeries(),
                      ContinueWatchingSeries(),
                      ContinueWatchingSeries(),
                      ContinueWatchingSeries(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContinueWatchingSeries extends StatelessWidget {
  const ContinueWatchingSeries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              //Stack Rowu => Resim + pause icon
              Row(
                children: [
                  Container(
                    height: 180,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(sevenDeadlySins),
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 44,
                left: 34,
                child: Icon(
                  Icons.play_circle_outline_sharp,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(),
        ],
      ),
    );
  }
}

class continueText extends StatelessWidget {
  const continueText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Continue Watching for ismail",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class mainPoster extends StatelessWidget {
  const mainPoster({
    Key? key,
    required double width,
    required double height,
  })  : _width = width,
        _height = height,
        super(key: key);

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: _width,
              height: _height * 0.73,
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0, 0.8, 1],
                ),
              ),
              child: Image.network(
                darkNetflix,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: _height * 0.065,
              left: _width * 0.03,
              child: Row(
                children: [
                  Text(
                    "Action",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.circle,
                    color: Colors.yellow,
                    size: 7,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Sci-Fi",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.circle,
                    color: Colors.yellow,
                    size: 7,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Thriller",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.circle,
                    color: Colors.yellow,
                    size: 7,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Mysteries",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              left: _width * 0.16,
              bottom: _height * 0.015,
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                      Text(
                        "My List",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white),
                        ),
                        Positioned(
                          top: 4,
                          child: Icon(Icons.play_arrow),
                        ),
                        Positioned(
                          top: 4,
                          left: 30,
                          child: Text(
                            "Play",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 60),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(
                          "Info",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
