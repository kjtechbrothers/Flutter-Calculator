import 'package:flutter/material.dart';
import 'package:calculator/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';

  var answer = '' ;
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Text(userInput.toString(),style: const TextStyle(fontSize: 40,color: Colors.white)),
                        Text(answer.toString(),style: const TextStyle(fontSize: 40,color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(title: 'AC',onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {

                            });
                          },),
                          MyButton(title: '+/-',onPress: (){
                            userInput += '+/-';
                            setState(() {

                            });
                          },),
                          MyButton(title: '%',onPress: () {
                            userInput += '%';
                            setState(() {

                            });
                          },),
                          MyButton(title: '/',onPress: () {
                            userInput += '/';
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '7',onPress: () {
                            userInput += '7';
                            setState(() {

                            });
                          },),
                          MyButton(title: '8',onPress: (){
                            userInput += '8';
                            setState(() {

                            });
                          },),
                          MyButton(title: '9',onPress: () {
                            userInput += '9';
                            setState(() {

                            });
                          },),
                          MyButton(title: 'x',onPress: () {
                            userInput += 'x';
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '4',onPress: () {
                            userInput += '4';
                            setState(() {

                            });
                          },),
                          MyButton(title: '5',onPress: (){
                            userInput += '5';
                            setState(() {

                            });
                          },),
                          MyButton(title: '6',onPress: () {
                            userInput += '6';
                            setState(() {

                            });
                          },),
                          MyButton(title: '-',onPress: () {
                            userInput += '-';
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '1',onPress: () {
                            userInput += '1';
                            setState(() {

                            });
                          },),
                          MyButton(title: '2',onPress: (){
                            userInput += '2';
                            setState(() {

                            });
                          },),
                          MyButton(title: '3',onPress: () {
                            userInput += '3';
                            setState(() {

                            });
                          },),
                          MyButton(title: '+',onPress: () {
                            userInput += '+';
                            setState(() {

                            });
                          },color: const Color(0xffffa00a),),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '0',onPress: () {
                            userInput += '0';
                            setState(() {

                            });
                          },),
                          MyButton(title: '.',onPress: (){
                            userInput += '.';
                            setState(() {

                            });
                          },),
                          MyButton(title: 'DEL',onPress: () {
                            userInput = userInput.substring(0 ,userInput.length -1);
                            setState((){

                            });

                          },),
                          MyButton(title: '=',onPress: () {
                            equalPress();
                            setState((){

                            });
                          },color: const Color(0xffffa00a),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void equalPress(){
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression =p.parse(finalUserInput);
    ContextModel contextModel=ContextModel();
    double eval=expression.evaluate(EvaluationType.REAL,contextModel);
    answer=eval.toString();
  }
}