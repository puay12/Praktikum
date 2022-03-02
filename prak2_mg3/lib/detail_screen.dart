import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('asset/img/submarine.jpg'),
              Container(
                margin: EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Text(
                  "Surabaya Submarine Monument",
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
                      children: const <Widget>[
                        Icon(Icons.calendar_today),
                        Text("Open Everyday",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12.0,
                            )),
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
                margin: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 32.0, right: 32),
                padding: const EdgeInsets.all(24.0),
                child: const Text(
                  "Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and well maintained. Car park costs 10k, entrance fee 15k/person. You can see KRI Pasopati there. It is a Russian whiskey class. You can also watch the video about the Indonesian Navy at the building beside the submarine.",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network('https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
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
        ) 
      ), 
    );
  }
}