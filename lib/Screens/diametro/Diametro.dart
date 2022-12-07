import 'package:circle_app/Components/GenericBoton/GenericBoton.dart';
import 'package:circle_app/Components/GenericInput/GenericInput.dart';
import 'package:circle_app/Screens/diametro/funciones.dart';
import 'package:flutter/material.dart';

//Pantalla donde se muestra la interfas principal
class Diametro extends StatefulWidget {
  const Diametro({Key? key}) : super(key: key);

  @override
  State<Diametro> createState() => _DiametroState();
}

class _DiametroState extends State<Diametro> {
  late TextEditingController controller;
  var perime = '';
  var area = '';
//funciones para agregar el valor cm o cm^2
  String perimetroGraduacion() {
    return perime == '' ? '' : 'cm';
  }

  String perimetroArea() {
    return perime == '' ? '' : 'cm^2';
  }

  //funcion que obtine el perimetro y el area
  void obtenerDatos(diametro) {
    setState(() {
      perime = obtenerPerimetro(diametro);
      area = obtenerArea(diametro);
    });
  }

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Area y Perimetro',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 45, right: 45, top: 25),
          child: Column(
            children: [
              GenericInput(
                text: 'Ingresa un diametro en cm',
                control: controller,
                typeKeyboard: TextInputType.number,
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5,
                          color: perime == ''
                              ? Colors.transparent
                              : Colors.orange),
                      shape: BoxShape.circle,
                      color: area == '' ? Colors.blue : Colors.green),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'PERIMETRO:',
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(
                      '${perime}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${perimetroGraduacion()}',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'AREA:',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(
                      '${area}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${perimetroArea()}',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              GenericBoton(
                  texto: 'Calcular',
                  callback: () {
                    obtenerDatos(controller.text.toString());
                    FocusScope.of(context).unfocus();
                  },
                  color: Colors.red,
                  textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
