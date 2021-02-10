import 'package:flutter/material.dart';

class NumButtons extends StatelessWidget {
  final String child;
  final Function onTap;
  const NumButtons({Key key, this.child, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Color(0xFF1f1f32),
        splashColor: Colors.white24,
        child: Text(
          child,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        onPressed: () => onTap(),
      ),
    );
  }
}
