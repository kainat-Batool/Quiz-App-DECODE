import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  final List<Map<String, dynamic>> _questions = [
    {'question': 'Flutter is developed by Google.', 'answer': true},
    {'question': 'Dart is a statically typed language.', 'answer': false},
    {'question': 'Widgets in Flutter are immutable.', 'answer': false},
    {'question': 'The latest version of Flutter is 3.0.', 'answer': false},
    {
      'question':
          'Android Studio is the recommended IDE for Flutter development.',
      'answer': true
    },
    {'question': 'Flutter uses the Skia graphics engine.', 'answer': true},
    {
      'question': 'Flutter apps can only run on Android devices.',
      'answer': false
    },
    {
      'question':
          'Hot reload allows you to see the changes in your code instantly.',
      'answer': true
    },
    {
      'question': 'Flutter is based on the Java programming language.',
      'answer': false
    },
    {
      'question': 'You can use Flutter to build web applications.',
      'answer': true
    },
    {
      'question': 'Flutter is primarily used for game development.',
      'answer': false
    },
    {
      'question': 'Google Ads can be easily integrated into Flutter apps.',
      'answer': true
    },
    {
      'question':
          'Flutter has built-in support for internationalization (i18n).',
      'answer': true
    },
    {'question': 'Flutter is a hybrid framework.', 'answer': false},
    {
      'question':
          'You can create custom animations in Flutter using the Animation class.',
      'answer': true
    },
    {
      'question': 'Flutter uses platform-specific UI components.',
      'answer': false
    },
    {
      'question': 'Firebase is a backend service commonly used with Flutter.',
      'answer': true
    },
    {
      'question': 'Flutter apps can be compiled to native ARM code.',
      'answer': true
    },
    {'question': 'Flutter was first released in 2017.', 'answer': true},
    {
      'question': 'Google Ads can be easily integrated into Flutter apps.',
      'answer': true
    },
  ];

  void _answerQuestion(bool answer) {
    bool isCorrect = _questions[_currentQuestionIndex]['answer'] == answer;
    setState(() {
      if (isCorrect) {
        _correctAnswers++;
      } else {
        _wrongAnswers++;
      }
      _currentQuestionIndex = (_currentQuestionIndex + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                _questions[_currentQuestionIndex]['question'],
                style: const TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _answerQuestion(true),
            child: const Text('True'),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () => _answerQuestion(false),
            child: const Text('False'),
          ),
          const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.check_circle, color: Colors.green, size: 50.0),
                onPressed: () {},
              ),
              Text(
                '$_correctAnswers',
                style: const TextStyle(fontSize: 24.0),
              ),
              IconButton(
                icon: const Icon(Icons.cancel, color: Colors.red, size: 50.0),
                onPressed: () {},
              ),
              Text(
                '$_wrongAnswers',
                style: const TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
