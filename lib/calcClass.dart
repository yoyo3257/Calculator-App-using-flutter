import 'buttonsCalc.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '0';
  double? num1, num2;
  String? operator;
  void pressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        display = '0';
        num2 = null;
        num1 = null;
        operator = null;
      } else if (buttonText == "+/-") {
        display = (double.parse(display) * -1).toString();
      } else if (buttonText == '%') {
        display = (double.parse(display) / 100).toString();
      } else if (buttonText == '=') {
        if (operator == '+') {
          display = (num1! + num2!).toString();
          num1 = num1! + num2!;
          num2 = null;
        } else if (operator == '-') {
          display = (num1! - num2!).toString();
          num1 = num1! - num2!;
          num2 = null;
        } else if (operator == 'x') {
          display = (num1! * num2!).toString();
          num1 = num1! * num2!;
          num2 = null;
        } else if (operator == '÷') {
          display = (num1! / num2!).toString();
          num1 = num1! / num2!;
          num2 = null;
        }
      } else if ('0123456789.'.contains(buttonText)) {
        if (operator == null) {
          if (display == '0') {
            display = buttonText;
          } else {
            display += buttonText;
          }
          num1 = double.parse(display);
        } else {
          display += buttonText;
          num2 =
              double.parse(display.substring(display.indexOf(operator!) + 1));
        }
      } else {
        if (num1 != null && num2 == null) {
          operator = buttonText;
          display += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Calculator App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: SizedBox(
          width: double.infinity,
          // height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                display,
                style: TextStyle(fontSize: 80, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonCalc(
                      text: 'AC',
                      event: () => pressed('AC'),
                      buttonColor: Colors.white,
                      textColor: Colors.black),
                  buttonCalc(
                      text: '+/-',
                      event: () => pressed('+/-'),
                      buttonColor: Colors.white,
                      textColor: Colors.black),
                  buttonCalc(
                      text: '%',
                      event: () => pressed('%'),
                      buttonColor: Colors.white,
                      textColor: Colors.black),
                  buttonCalc(
                      text: '÷',
                      event: () => pressed('÷'),
                      buttonColor: Colors.deepOrange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonCalc(text: '7', event: () => pressed('7')),
                  buttonCalc(text: '8', event: () => pressed('8')),
                  buttonCalc(text: '9', event: () => pressed('9')),
                  buttonCalc(
                      text: 'x',
                      event: () => pressed('x'),
                      buttonColor: Colors.deepOrange)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonCalc(text: '4', event: () => pressed('4')),
                  buttonCalc(text: '5', event: () => pressed('5')),
                  buttonCalc(text: '6', event: () => pressed('6')),
                  buttonCalc(
                      text: '-',
                      event: () => pressed('-'),
                      buttonColor: Colors.deepOrange)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonCalc(text: '1', event: () => pressed('1')),
                  buttonCalc(text: '2', event: () => pressed('2')),
                  buttonCalc(text: '3', event: () => pressed('3')),
                  buttonCalc(
                      text: '+',
                      event: () => pressed('+'),
                      buttonColor: Colors.deepOrange)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonCalc(text: '0     ', event: () => pressed('0')),
                  buttonCalc(text: '.', event: () => pressed('.')),
                  buttonCalc(
                      text: '=',
                      event: () => pressed('='),
                      buttonColor: Colors.deepOrange)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
