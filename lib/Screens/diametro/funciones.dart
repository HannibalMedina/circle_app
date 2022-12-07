import 'dart:math' as math;

//funcion que obtiene el perimetro apartir un diametro dado en cm
String obtenerPerimetro(diametro) {
  var diametroParseado = double.parse(diametro);
  return (2 * (math.pi * (diametroParseado / 2))).toStringAsFixed(2);
}

//funcion que obtiene el area apartir un diametro dado en cm
String obtenerArea(diametro) {
  var diametroParseado = double.parse(diametro);
  return (math.pi * math.pow((diametroParseado / 2), 2)).toStringAsFixed(2);
}
