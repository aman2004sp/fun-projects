import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amrendra_project/question_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizApp(),
    );
  }
}


class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Test _test = Test();

  Widget _quizStatus() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: Iterable<int>.generate(_test.quesList.length).toList().map((idx) {
            if (_test.quesList[idx].getStatus() == null)
              return Container(
                color: _test.index == idx ? Colors.yellow: null,
                child: IconButton(
                  icon: Icon(Icons.check_box_outline_blank, color: Colors.blue, size: 38.0),
                  onPressed: () => setState(() => _test.index = idx),
                ),
              );
            else
              return (_test.quesList[idx].getStatus() ?? false) ?
                Container(
                  color: _test.index == idx ? Colors.yellow: null,
                  child: IconButton(
                    icon: Icon(Icons.done_rounded, color: Colors.green, size: 38.0,),
                    onPressed: () => setState(() => _test.index = idx),
                  ),
                ) :
                Container(
                  color: _test.index == idx ? Colors.yellow: null,
                  child: IconButton(
                    icon: Icon(Icons.clear_rounded, color: Color(0xFFE83651), size: 38.0,),
                    onPressed: () => setState(() => _test.index = idx),
                  ),
                );
          }).toList()
      ),
    );
  }

  Widget _quizComplete() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        Material(
          color: Color(0xFFDEBD58),
          elevation: 50,
          child: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'You have successfully completed the quiz!',
                  textScaleFactor: 2.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'Score = ${_test.getScore()}/${_test.quesList.length}',
                  textScaleFactor: 2.0,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => setState(() => _test = Test()),
                      child: const Text('Restart', textScaleFactor: 1.5,),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => _test.finished = false),
                      child: const Text('Continue', textScaleFactor: 1.5,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 200,),
        _quizStatus(),
      ],
    );
  }

  Widget _getQuestionPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              child: const Text('Finish Test', textScaleFactor: 2,),
              onPressed: () => setState(() => _test.finished = true),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Text(
              _test.quesList[_test.index].getQuestion(),
              style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
          ),
        ),
        Divider(height: 0.0, thickness: 2.0,),
        SizedBox(height: 40.0,),
        ElevatedButton(
          onPressed: () => setState(() {
            if (_test.quesList[_test.index].getStatus() == null)
              _test.quesList[_test.index++].check(true);
            if (_test.index == _test.quesList.length)
              _test.index--;
          }),
          child: const Text('True', style: const TextStyle(fontSize: 25.0),),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            elevation: MaterialStateProperty.all<double>(20.0),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(70, 40, 70, 40)),
          ),
        ),
        SizedBox(height: 40.0,),
        ElevatedButton(
          onPressed: () => setState(() {
            if (_test.quesList[_test.index].getStatus() == null)
              _test.quesList[_test.index++].check(false);
            if (_test.index == _test.quesList.length)
              _test.index--;
          }),
          child: const Text('False', style: const TextStyle(fontSize: 25.0),),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE83651)),
            elevation: MaterialStateProperty.all<double>(20.0),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(70, 40, 70, 40)),
          ),
        ),
        SizedBox(height: 40.0,),
        Divider(height: 0.0, thickness: 2.0,),
        _quizStatus(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quiz', textScaleFactor: 2,),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _test.finished ? _quizComplete() : _getQuestionPage(),
    );
  }
}