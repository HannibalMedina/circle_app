import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
//Se crea input para poder captrar el dato de diametro

class GenericInput extends StatelessWidget {
  final text;
  final control;
  final typeKeyboard;
  const GenericInput(
      {Key? key,
      required this.text,
      required this.control,
      required this.typeKeyboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: typeKeyboard,
      controller: control,
      decoration: InputDecoration(label: Text(text)),
    );
  }
}
