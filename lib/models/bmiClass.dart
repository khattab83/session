import 'dart:math';

import 'package:flutter/material.dart';

class Bmi {
  double weight;
  double height;
  int age;
  bool isMale;
  double bodyFats;
  String bodyState;
  int image;
  Color stateColor;

  Bmi(
      {this.weight,
      this.height,
      this.age,
      this.isMale,
      this.bodyFats,
      this.bodyState,
      this.image,
      this.stateColor});

  double bmiRes() {
    double res = weight / pow(height / 100, 2);
    return res;
  }

  double bodyFat() {
    if (isMale) {
      return bodyFats = (1.2 * bmiRes()) + (0.23 * age) - 16.2;
    } else {
      return bodyFats = (1.2 * bmiRes()) + (0.23 * age) - 5.4;
    }
  }

  String bmiState() {
    if (bmiRes() >= 35) {
      image = 4;
      stateColor = Colors.deepOrange;
      return bodyState = 'Obesity level II';
    } else if (bmiRes() >= 30) {
      image = 3;
      stateColor = Colors.orange[500];
      return bodyState = 'Obesity level I';
    } else if (bmiRes() >= 25) {
      image = 2;
      stateColor = Colors.yellow[300];
      return bodyState = 'Overweight';
    } else if (bmiRes() >= 19) {
      image = 1;
      stateColor = Colors.green;
      return bodyState = 'Normal';
    } else {
      image = 0;
      stateColor = Color(0xff9abbda);
      return bodyState = 'Under Weight';
    }
  }

  int bmiStateImage() {
    if (bmiRes() >= 35) {
      return image = 4;
    } else if (bmiRes() >= 30) {
      return image = 3;
    } else if (bmiRes() >= 25) {
      return image = 2;
    } else if (bmiRes() >= 19) {
      return image = 1;
    } else {
      return image = 0;
    }
  }

  Color bmiStateColor() {
    if (bmiRes() >= 35) {
      return stateColor = Colors.deepOrange;
    } else if (bmiRes() >= 30) {
      return stateColor = Colors.orange[500];
    } else if (bmiRes() >= 25) {
      return stateColor = Colors.yellow[300];
    } else if (bmiRes() >= 19) {
      return stateColor = Colors.green;
    } else {
      return stateColor = Color(0xff9abbda);
    }
  }
}
