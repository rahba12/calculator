import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

String result = '0';
String number = '0';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void buttonPressed(String text) {
    setState(() {
      if (text == 'C') {
        result = '0';
        number = '0';
      } else if (text == 'DEL') {
        number = number.substring(0, number.length - 1);
        if (number.isEmpty) {
          number = text;
        }
      } else if (text == '=') {
        var expression = number;
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('×', '*');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'ERROR';
        }
      } else {
        if (number == '0') {
          number = text;
        } else {
          number = number + text;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              number,
              style: const TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: const TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        button(color: Colors.redAccent, height: 1, text: 'C'),
                        button(
                            color: Colors.blueAccent, height: 1, text: 'DEL'),
                        button(color: Colors.blueAccent, height: 1, text: '÷'),
                      ],
                    ),
                    const TableRow(children: [
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ]),
                    TableRow(
                      children: [
                        button(
                            color: Colors.grey.shade700, height: 1, text: '7'),
                        button(
                            color: Colors.grey.shade700, height: 1, text: '8'),
                        button(
                            color: Colors.grey.shade700, height: 1, text: '9'),
                      ],
                    ),
                    const TableRow(children: [
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ]),
                    TableRow(
                      children: [
                        button(
                            color: Colors.grey.shade700, height: 1, text: '4'),
                        button(
                            color: Colors.grey.shade700, height: 1, text: '5'),
                        button(
                            color: Colors.grey.shade700, height: 1, text: '6'),
                      ],
                    ),
                    const TableRow(children: [
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ]),
                    TableRow(
                      children: [
                        button(
                            color: Colors.grey.shade700, height: 1, text: '1'),
                        button(
                            color: Colors.grey.shade700, height: 1, text: '2'),
                        button(
                            color: Colors.grey.shade700, height: 1, text: '3'),
                      ],
                    ),
                    const TableRow(children: [
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ]),
                    TableRow(
                      children: [
                        button(
                            color: Colors.grey.shade700, height: 1, text: '.'),
                        button(
                            color: Colors.grey.shade700, height: 1, text: '0'),
                        button(
                            color: Colors.grey.shade700, height: 1, text: '00'),
                      ],
                    ),
                    const TableRow(children: [
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        button(height: 1, color: Colors.blueAccent, text: '×'),
                      ],
                    ),
                    const TableRow(children: [
                      SizedBox(
                        height: 3,
                      ),
                    ]),
                    TableRow(
                      children: [
                        button(height: 1, color: Colors.blueAccent, text: '-'),
                      ],
                    ),
                    const TableRow(children: [
                      SizedBox(
                        height: 3,
                      ),
                    ]),
                    TableRow(
                      children: [
                        button(height: 1, color: Colors.blueAccent, text: '+'),
                      ],
                    ),
                    const TableRow(children: [
                      SizedBox(
                        height: 3,
                      ),
                    ]),
                    TableRow(children: [
                      button(
                          height: 1.8,
                          color: Colors.redAccent,
                          text: '=',
                          padding: 5),
                    ]),
                    const TableRow(children: [
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget button(
          {required Color color,
          required double height,
          required String text,
          double? padding}) =>
      Container(
        padding: EdgeInsets.only(right: padding ?? 0),
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.1 * height,
        child: MaterialButton(
          color: color,
          onPressed: () => buttonPressed(text),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      );
}
