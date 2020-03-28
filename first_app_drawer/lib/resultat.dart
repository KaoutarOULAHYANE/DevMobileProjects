import 'package:flutter/material.dart';

class Resultat extends StatelessWidget {
  final int score;
  final int length;
  final Function function;
  Resultat({this.score, this.length, this.function});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Votre score est  : ${(100 * score / length).round()} %',
            style: TextStyle(
              fontSize: 22,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
              child: Text("Restart"),
              color: Colors.deepOrangeAccent,
              textColor: Colors.white,
              onPressed: function),
        ],
      ),
    );
  }
}
