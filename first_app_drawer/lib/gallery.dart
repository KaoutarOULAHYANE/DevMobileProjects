import 'package:flutter/material.dart';

import './gallery-data.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword = "";
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent, title: Text('$keyword')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Key word'),
              controller: textEditingController,
              onChanged: (value) {
                setState(() {
                  this.keyword = value;
                });
              },
              onSubmitted: (value) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GalleryData(value)),
                );
                textEditingController.text = "";
              },
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GalleryData(this.keyword)));
                },
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: Text('Get Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
