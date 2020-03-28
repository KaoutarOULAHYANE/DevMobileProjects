import 'package:flutter/material.dart';
import './gallery.dart';
import './quiz.dart';
import './qr-code-page.dart';
import './weather-form.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("./images/profile.png"),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.white]),
            ),
          ),
          ListTile(
            title: Text(
              'Quiz',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Quiz()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Weather',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeatherForm(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Gallery',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Gallery(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'QR Scan',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRCodePage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
