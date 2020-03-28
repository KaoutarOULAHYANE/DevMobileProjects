import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  final String city;
  Weather(this.city);
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<dynamic> data;
  getData(url) {
    http.get(Uri.encodeFull(url), headers: {'accept': 'application/json'}).then(
        (resp) {
      setState(() {
        data = json.decode(resp.body)['list'];
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    String url = 'https://samples.openweathermap.org/data/2.5/forecast?q=' +
        '${this.widget.city}&appid=a457%208e39643716894ec78b28a71c7110';
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.city}'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: (data == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.deepOrangeAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'images/' +
                                    '${data[index]['weather'][0]['main'].toLowerCase()}' +
                                    '.png',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${new DateFormat('E dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(data[index]['dt'] * 1000000))}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(data[index]['dt'] * 1000000))} | ${data[index]['weather'][0]['main']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${data[index]['main']['temp'].round()} °C",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
