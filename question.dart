class QuestionTF {
  String ques;
  bool ans;
  bool? status;

  QuestionTF({ required this.ques, required this.ans });

  String getQuestion() => ques;
  void check(bool yourAns) => setStatus(ans == yourAns);
  void setStatus(bool newStatus) => status = newStatus;
  bool? getStatus() => status;
}