import 'package:flappy_watch_store/models/watch.dart';
import 'package:flutter/material.dart';

class WatchDetailPage extends StatefulWidget {
  final Watch watch;
  WatchDetailPage({Key key, this.watch}) : super(key: key);

  @override
  _WatchDetailPageState createState() => _WatchDetailPageState();
}

class _WatchDetailPageState extends State<WatchDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF292a37),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF292a37),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Hero(
                  tag: widget.watch.id,
                  child: Container(
                    width: _size.width * 0.7,
                    height: _size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(widget.watch.imageURL))),
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i <= 8; i++)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: i == 5 ? 10 : 7,
                    width: i == 5 ? 10 : 7,
                    decoration: BoxDecoration(
                        color: i == 5 ? Colors.redAccent : Color(0xFF343645),
                        shape: BoxShape.circle),
                  )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: _size.height * 0.6,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF343645),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(40))),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      widget.watch.name,
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        for (int i = 0; i <= 4; i++)
                          Icon(
                            Icons.star,
                            size: 25,
                            color: i == 4 ? Colors.grey : Colors.redAccent,
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '24 ratings',
                          style: TextStyle(
                              color: Colors.white, height: 1.5, fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: _size.width * 0.8,
                      child: Text(
                        widget.watch.description,
                        style: TextStyle(
                            color: Colors.white, height: 1.5, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
