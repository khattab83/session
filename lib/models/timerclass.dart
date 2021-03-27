class Ques {
  String ques;
  List<String> answer;
  String ans1;
  String ans2;
  String ans3;
  String ans4;
  int trueAns;

  Ques(
      {this.ques,
      this.ans1,
      this.ans2,
      this.ans3,
      this.ans4,
      this.trueAns,
      this.answer});
}

List<Ques> questions = [
  Ques(
      ques: 'Capital of Kuwait is ...',
      trueAns: 0,
      answer: ['kuwait', 'Cairo', 'Doha', 'Tunis']),
  Ques(
      ques: 'Capital of Egypt is ...',
      trueAns: 1,
      answer: ['kuwait', 'Cairo', 'Doha', 'Tunis']),
  Ques(
      ques: 'Capital of Tunis is ...',
      trueAns: 3,
      answer: ['kuwait', 'Cairo', 'Doha', 'Tunis']),
  Ques(
      ques: 'Capital of Qater is ...',
      trueAns: 2,
      answer: ['kuwait', 'Cairo', 'Doha', 'Tunis']),
  Ques(
      ques: 'Capital of Ksa is ...',
      trueAns: 2,
      answer: ['kuwait', 'Cairo', 'Ryaid', 'Tunis']),
];
