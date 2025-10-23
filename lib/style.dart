import 'package:flutter/material.dart';

InputDecoration myInput(String label) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    labelText: label,
    border: OutlineInputBorder(),
    maintainHintSize: true,
  );
}

ButtonStyle myButton() {
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(15),
    elevation: 5,
    shadowColor: Colors.greenAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    alignment: Alignment.center,
  );
}

SizedBox mySize(child) {
  return SizedBox(
    height: 70,
    width: double.infinity,
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.green.shade50,
      elevation: 3,
      shadowColor: Colors.greenAccent,
      child: child,
    ),
  );
}

TextStyle myText(double size, FontWeight weight,{color = Colors.white}){
  return TextStyle(
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: 1,
  );
}
