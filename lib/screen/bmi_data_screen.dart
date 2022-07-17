import 'package:bmi/constant/constant.dart';
import 'package:bmi/constant/helpers.dart';
import 'package:bmi/screen/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  double height = 150;
  int weight = 0;
  int age = 20;
  double bmi = 0;
  String suggest = '';
  String category = "";
  String? gender;

  generateWeight() {
    List<Widget> weight = [];
    for (int i = 0; i <= 220; i++) {
      weight.add(
        Text(
          i.toString(),
          style: labelTextStyle!.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    gender = "male";
                  });
                },
                child: BmiCard(
                  borderColor: (gender == "male") ? Colors.white : primaryColor,
                  child: const GenderIconText(
                      gender: "Male", iconData: Icons.male),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    gender = "female";
                  });
                },
                child: BmiCard(
                  borderColor:
                      (gender == "female") ? Colors.white : primaryColor,
                  child: const GenderIconText(
                      gender: "Female", iconData: Icons.female),
                ),
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
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: CupertinoPicker(
                        children: generateWeight(),
                        magnification: 1.8,
                        useMagnifier: true,
                        itemExtent: 25,
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            weight = value;
                          });
                        },
                      ),
                    ),
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
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: CupertinoPicker(
                        children: generateWeight(),
                        magnification: 1.8,
                        useMagnifier: true,
                        itemExtent: 25,
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            age = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )),
            ],
          )),
          GestureDetector(
            onTap: () {
              final BmiCalculator bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();
              bmiCalculator.categoryData();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResultScreen(
                      bmi: bmiCalculator.bmi!,
                      category: bmiCalculator.bmiCategroy!,
                      suggest: bmiCalculator.suggest!,
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
  const BmiCard({Key? key, this.child, this.borderColor = primaryColor})
      : super(key: key);
  final Widget? child;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!)),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}
