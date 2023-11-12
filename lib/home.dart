import 'package:bmi_calc/widgets/background_shape_left.dart';
import 'package:bmi_calc/widgets/background_shape_right.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final weighContriller = TextEditingController();
  final heightContriller = TextEditingController();

  double resultBMI = 0;
  String resultText = '';
  double widtGood = 100;
  double widthbad = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'BMI?',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: weighContriller,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'وزن',
                          hintStyle:
                              TextStyle(color: Colors.orange.withOpacity(0.5))),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: heightContriller,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'قد',
                          hintStyle:
                              TextStyle(color: Colors.orange.withOpacity(0.5))),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  final weight = double.parse(weighContriller.text);
                  final height = double.parse(heightContriller.text);
                  setState(() {
                    resultBMI = weight / (height * height);
                    if (resultBMI > 25) {
                      widthbad = 270;
                      widtGood = 50;

                      resultText = 'شما اضافه وزن دارید';
                    } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                      widthbad = 50;
                      widtGood = 270;
                      resultText = 'وزن شما نرمال است';
                    } else {
                      resultText = 'وزن شما کمتر از حد نرمال است';
                      widthbad = 20;
                      widtGood = 20;
                    }
                  });
                },
                child: Text(
                  '! محاسبه کن ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              Text(
                '${resultBMI.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
              ),
              Text(
                '$resultText',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              SizedBox(height: 80),
              RightShape(width: widthbad),
              SizedBox(height: 15),
              LeftShape(
                width: widtGood,
              ),
              SizedBox(height: 15),
            ],
          )),
    );
  }
}
