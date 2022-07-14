import 'package:bmi/constant/constant.dart';
import 'package:bmi/screen/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  double height = 150;
  int weight = 65;
  int age = 20;
  double bmi = 0;
  String suggest = '';
  String category = "";

  calculateBmi(double height, int weight) {
    double heightInMeter = height / 100;
    bmi = weight / (heightInMeter * heightInMeter);
  }

  categoryData() {
    if (bmi < 17.0) {
      category = "Thin";
      suggest = "Your BMI is Low, Eat more!";
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      category = "A bit skinny";
      suggest = "Your BMI is quite Low, Eat more!";
    } else if (bmi >= 18.5 && bmi <= 25.0) {
      category = "Normal";
      suggest = "Your BMI Normal";
    } else if (bmi > 25.5 && bmi <= 27.0) {
      category = "Chubby";
      suggest = "Your BMI is quite high, eat less!";
    } else {
      category = "Fat";
      suggest = "Your BMI is high, Diet!";
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: const [
              Expanded(
                  child: BmiCard(
                child: GenderIconText(gender: "Male", iconData: Icons.male),
              )),
              Expanded(
                  child: BmiCard(
                child: GenderIconText(gender: "Female", iconData: Icons.female),
              )),
            ],
          )),
          Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: labelTextStyle!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(height.ceil().toString(), style: numberTextStyle),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 80,
                    max: 200,
                    activeColor: Colors.white,
                    thumbColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WEIGHT",
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                              width: 56, height: 56),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                              width: 56, height: 56),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: labelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                              width: 56, height: 56),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                              width: 56, height: 56),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          GestureDetector(
            onTap: () {
              calculateBmi(height, weight);
              categoryData();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResultScreen(
                      bmi: bmi,
                      category: category,
                      suggest: suggest,
                    ),
                  ));
            },
            child: Container(
              height: 80,
              color: const Color(0xffec3c66),
              child: const Center(
                child: Text(
                  'Hitung BMI',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({Key? key, required this.gender, required this.iconData})
      : super(key: key);
  final String gender;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        iconData,
        size: 80,
        color: Colors.white,
      ),
      Text(
        gender,
        style: genderTexstyle,
      )
    ]);
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}
