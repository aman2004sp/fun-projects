import 'package:amrendra_project/question.dart';

class Test {
  bool finished = false;
  int index = 0;
  List<QuestionTF> quesList = [];
  Test() {
    quesList = [
      QuestionTF(
        ques: 'Mercury is the hottest planet in the solar system.',
        ans: false,
      ),
      QuestionTF(
        ques: 'An octopus has three hearts.',
        ans: true,
      ),
      QuestionTF(
        ques: 'Driving in a car is statistically safer than flying in an aeroplane.',
        ans: false,
      ),
      QuestionTF(
        ques: "'A' is the most common letter used in the English language.",
        ans: false,
      ),
      QuestionTF(
        ques: 'Bananas are curved because they grow upwards towards the sun.',
        ans: true,
      ),
      QuestionTF(
        ques: "Henry Cavill (plays Superman's role) is taller than Ben Affleck (plays Batman's role).",
        ans: false,
      ),
      QuestionTF(
        ques: 'Australia is wider than the Moon.',
        ans: true,
      ),
      QuestionTF(
        ques: 'The unicorn is the national animal of Scotland.',
        ans: true,
      ),
      QuestionTF(
        ques: 'A flea can accelerate faster than a space shuttle.',
        ans: true,
      ),
      QuestionTF(
        ques: 'A panda baby is smaller than a mouse.',
        ans: true,
      ),
    ];
  }

  int getScore() {
    int score = 0;
    for (QuestionTF q in quesList)
      if (q.getStatus() ?? false)
        score++;
    return score;
  }
}