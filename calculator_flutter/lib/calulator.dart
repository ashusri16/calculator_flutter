import 'package:calculator_flutter/local_widgets/num_buttons.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final evaluator = ExpressionEvaluator();
  String _display = "";
  final RegExp regExp = RegExp("\d+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              _display,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            height: 120,
            color: Colors.lightGreen[200],
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(12.0),
          ),
          Container(
            child: Table(
              children: [
                TableRow(children: [
                  NumButtons(
                    child: "C",
                    onTap: () {
                      setState(() {
                        _display = "";
                      });
                    },
                  ),
                  Container(),
                  Container(),
                  NumButtons(
                    child: "<-",
                    onTap: () {
                      if (_display.isNotEmpty) {
                        setState(() {
                          _display = _display.substring(0, _display.length - 1);
                        });
                      }
                    },
                  ),
                ]),
                TableRow(children: [
                  NumButtons(
                    child: "7",
                    onTap: () {
                      setState(() {
                        _display = _display + "7";
                      });
                    },
                  ),
                  NumButtons(
                    child: "8",
                    onTap: () {
                      setState(() {
                        _display = _display + "8";
                      });
                    },
                  ),
                  NumButtons(
                    child: "9",
                    onTap: () {
                      setState(() {
                        _display = _display + "9";
                      });
                    },
                  ),
                  NumButtons(
                      child: "+",
                      onTap: () {
                        if (_display != "") {
                          if (regExp.hasMatch(_display[_display.length - 1])) {
                            setState(
                              () {
                                _display += "+";
                              },
                            );
                          } else {
                            setState(() {
                              _display =
                                  _display.substring(0, _display.length - 1) +
                                      "+";
                            });
                          }
                        }
                      }),
                ]),
                TableRow(children: [
                  NumButtons(
                    child: "4",
                    onTap: () {
                      setState(() {
                        _display = _display + "4";
                      });
                    },
                  ),
                  NumButtons(
                    child: "5",
                    onTap: () {
                      setState(() {
                        _display = _display + "5";
                      });
                    },
                  ),
                  NumButtons(
                    child: "6",
                    onTap: () {
                      setState(() {
                        _display = _display + "6";
                      });
                    },
                  ),
                  NumButtons(
                    child: "*",
                    onTap: () {
                      if (_display != "") {
                        if (regExp.hasMatch(_display[_display.length - 1])) {
                          setState(
                            () {
                              _display += "*";
                            },
                          );
                        } else {
                          print("inside else");
                          setState(() {
                            _display =
                                _display.substring(0, _display.length - 1) +
                                    "*";
                          });
                        }
                      }
                    },
                  ),
                ]),
                TableRow(
                  children: [
                    NumButtons(
                      child: "1",
                      onTap: () {
                        setState(() {
                          _display = _display + "1";
                        });
                      },
                    ),
                    NumButtons(
                      child: "2",
                      onTap: () {
                        setState(() {
                          _display = _display + "2";
                        });
                      },
                    ),
                    NumButtons(
                      child: "3",
                      onTap: () {
                        setState(() {
                          _display = _display + "3";
                        });
                      },
                    ),
                    NumButtons(
                        child: "-",
                        onTap: () {
                          if (regExp.hasMatch(_display[_display.length - 1])) {
                            setState(
                              () {
                                _display += "-";
                              },
                            );
                          } else {
                            setState(() {
                              _display =
                                  _display.substring(0, _display.length - 1) +
                                      "-";
                            });
                          }
                        })
                  ],
                ),
                TableRow(children: [
                  NumButtons(
                    child: ".",
                    onTap: () {
                      setState(() {
                        _display = _display + ".";
                      });
                    },
                  ),
                  NumButtons(
                    child: "0",
                    onTap: () {
                      setState(() {
                        _display = _display + "0";
                      });
                    },
                  ),
                  NumButtons(
                    child: "÷",
                    onTap: () {
                      if (_display != "") {
                        if (regExp.hasMatch(_display[_display.length - 1])) {
                          setState(
                            () {
                              _display += "÷";
                            },
                          );
                        } else {
                          print("inside else");
                          setState(() {
                            _display =
                                _display.substring(0, _display.length - 1) +
                                    "÷";
                          });
                        }
                      }
                    },
                  ),
                  NumButtons(
                    child: "=",
                    onTap: () {
                      _display = _display.replaceAll("÷", "/");
                      Expression expression = Expression.parse(_display);
                      var cntx = {
                        "1": 1,
                        "2": 2,
                        "3": 3,
                        "4": 4,
                        "5": 5,
                        "6": 6,
                        "7": 7,
                        "8": 8,
                        "9": 9,
                        "0": 0,
                      };
                      var result = evaluator.eval(expression, cntx);
                      setState(() {
                        _display = result.toString();
                      });
                    },
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
