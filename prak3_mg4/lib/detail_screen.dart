import 'package:flutter/material.dart';
import 'package:prak3_mg4/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(place.imageAsset),
            Container(
              margin: EdgeInsets.only(top: 24.0, bottom: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      Text(place.dayopen,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12.0,
                          )),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.alarm_on_outlined),
                      Text(
                        place.timeopen,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.payment_outlined),
                      Text(
                        place.price,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              margin: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 32.0, right: 32),
              padding: const EdgeInsets.all(24.0),
              child: Text(
                place.desc,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('asset/img/img1.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('asset/img/img2.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('asset/img/img3.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
