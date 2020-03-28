import './resultat.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score = 0;

  final quiz = [
    {
      'title': 'Question 1',
      'answers': [
        {'answer': 'Answer 11', 'correct': false},
        {'answer': 'Answer 12', 'correct': false},
        {'answer': 'Answer 13', 'correct': true},
      ]
    },
    {
      'title': 'Question 2',
      'answers': [
        {'answer': 'Answer 21', 'correct': false},
        {'answer': 'Answer 22', 'correct': true},
        {'answer': 'Answer 23', 'correct': false},
      ]
    },
  ];

  void _restart() {
    setState(() {
      currentQuestion = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Quiz'),
      ),
      body: (this.quiz.length <= this.currentQuestion)
          ? Resultat(score: score, length: quiz.length, function: _restart)
          : ListView(
              children: [
                ListTile(
                  title: Center(
                    child: Text(
                      "Question ${currentQuestion + 1} / ${quiz.length}",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    quiz[currentQuestion]['title'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...(quiz[currentQuestion]['answers']
                        as List<Map<String, Object>>)
                    .map(
                  (answer) {
                    return ListTile(
                      title: Padding(
                        padding: EdgeInsets.all(8),
                        child: RaisedButton(
                          color: Colors.deepOrangeAccent,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              answer['answer'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                if (answer['correct'] == true) score++;
                                currentQuestion++;
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
