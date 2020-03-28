import 'package:flutter/material.dart';

import './weather.dart';

class WeatherForm extends StatefulWidget {
  @override
  _WeatherFormState createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  TextEditingController textEditingController = new TextEditingController();

  String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Weather'),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
                decoration: InputDecoration(labelText: 'Ville'),
                controller: textEditingController,
                onChanged: (String str) {
                  setState(() {
                    city = str;
                  });
                }),
            RaisedButton(
              color: Colors.deepOrangeAccent,
              textColor: Colors.white,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Get wheater",
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Weather(city)));
                textEditingController.text = "";
              },
            )
          ],
        ),
      )),
    );
  }
}
