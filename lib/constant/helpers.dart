class BmiCalculator {
  double? height;
  int? weight;
  double? bmi;
  String? bmiCategroy;
  String? suggest;

  BmiCalculator({required this.height, required this.weight});

  double calculateBmi() {
    double heightInMeter = height! / 100;
    bmi = weight! / (heightInMeter * heightInMeter);
    return bmi!;
  }

  String categoryData() {
    if (bmi! < 17.0) {
      bmiCategroy = "Thin";
      suggest = "Your BMI is Low, Eat more!";
    } else if (bmi! >= 17.0 && bmi! <= 18.4) {
      bmiCategroy = "A bit skinny";
      suggest = "Your BMI is quite Low, Eat more!";
    } else if (bmi! >= 18.5 && bmi! <= 25.0) {
      bmiCategroy = "Normal";
      suggest = "Your BMI Normal";
    } else if (bmi! > 25.5 && bmi! <= 27.0) {
      bmiCategroy = "Chubby";
      suggest = "Your BMI is quite high, eat less!";
    } else {
      bmiCategroy = "Fat";
      suggest = "Your BMI is high, Diet!";
    }
    return bmiCategroy!;
  }
}
