import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

//Se crea componente boton para poder ejecutar las funciones de la interfaz principal
class GenericBoton extends StatefulWidget {
  final callback;
  final texto;
  final color;
  final textColor;
  const GenericBoton(
      {Key? key,
      required this.texto,
      required this.callback,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  State<GenericBoton> createState() => _GenericBotonState();
}

class _GenericBotonState extends State<GenericBoton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.callback,
      child: Text(
        widget.texto,
        style: TextStyle(color: widget.textColor),
      ),
      style: ElevatedButton.styleFrom(primary: widget.color, elevation: 0),
    );
  }
}
