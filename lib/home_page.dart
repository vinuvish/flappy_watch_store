import 'package:flappy_watch_store/models/watch.dart';
import 'package:flappy_watch_store/watch_detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size _size;

  List<Watch> watchListAndroid = [
    Watch(
        id: '0001',
        name: "Apple's \nWear 2.0 smartwatch",
        price: '300',
        imageURL: 'assets/images/watch1.png',
        description:
            "Verizon is Mobvoi's first attempt at creating a smartwatch powered by their TicWear OS by Google operating system. TicWatch is compatible with Android and iOS devices. It can be used as a standalone fitness tracker and has built in GPS and heart rate sensor chipsets."),
    Watch(
        id: '0002',
        name: "Verizon's \nWear 2.0 smartwatch",
        price: '300',
        imageURL: 'assets/images/watch2.png',
        description:
            "Verizon is Mobvoi's first attempt at creating a smartwatch powered by their TicWear OS by Google operating system. TicWatch is compatible with Android and iOS devices. It can be used as a standalone fitness tracker and has built in GPS and heart rate sensor chipsets."),
    Watch(
        id: '0003',
        name: "Tick watch's \nWear 2.0 smartwatch",
        price: '300',
        imageURL: 'assets/images/watch3.png',
        description:
            "Tick watch is Mobvoi's first attempt at creating a smartwatch powered by their TicWear OS by Google operating system. TicWatch is compatible with Android and iOS devices. It can be used as a standalone fitness tracker and has built in GPS and heart rate sensor chipsets."),
  ];

  List<Watch> watchListSamsung = [
    Watch(
        id: '0004',
        name: "Samsung watch's \nWear 2.0 smartwatch",
        price: '300',
        imageURL: 'assets/images/watch4.png',
        description:
            "Samsung watch is Mobvoi's first attempt at creating a smartwatch powered by their TicWear OS by Google operating system. TicWatch is compatible with Android and iOS devices. It can be used as a standalone fitness tracker and has built in GPS and heart rate sensor chipsets."),
    Watch(
        id: '0005',
        name: "Gear watch's \nWear 2.0 smartwatch",
        price: '300',
        imageURL: 'assets/images/watch5.png',
        description:
            "Samsung is Mobvoi's first attempt at creating a smartwatch powered by their TicWear OS by Google operating system. TicWatch is compatible with Android and iOS devices. It can be used as a standalone fitness tracker and has built in GPS and heart rate sensor chipsets.")
  ];

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF292a37),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Color(0xFF292a37),
              elevation: 0,
              leading: Icon(
                Icons.clear_all_rounded,
                size: 40,
              ),
              title: Text(
                'Smartwatches',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ANDROID WEAR',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (Watch watch in watchListAndroid)
                          _buildWatchCard(watch)
                      ],
                    ),
                  ),
                  Text(
                    'SAMSUNG GEER',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (Watch watch in watchListSamsung)
                          _buildWatchCard(watch)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWatchCard(Watch watch) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return WatchDetailPage(
                  watch: watch,
                );
              },
              fullscreenDialog: false));
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              width: _size.width * 0.7,
              height: _size.height * 0.38,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xFF1e1f28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      watch.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int i = 0; i <= 5; i++)
                          Icon(
                            Icons.star,
                            size: 15,
                            color: i == 5 ? Colors.grey : Colors.redAccent,
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Hero(
              tag: watch.id,
              child: Container(
                width: _size.width * 0.5,
                height: _size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(watch.imageURL))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
