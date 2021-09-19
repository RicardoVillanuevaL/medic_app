import 'package:flutter/foundation.dart';

class Metrics with ChangeNotifier, DiagnosticableTreeMixin {
  double _calculo = 0.0;
  double _peso = 0.0;
  double _estatura = 0.0;
  String _categoria = "";

  double get calculo => _calculo;

  double get peso => _peso;

  double get estatura => _estatura;

  String get categoria => _categoria;

  void setCalculo(double calculo) {
    this._calculo = calculo;
    notifyListeners();
  }

  void setPeso(double peso) {
    this._peso = peso;
    notifyListeners();
  }

  void setEstatura(double estatura) {
    this._estatura = estatura;
    notifyListeners();
  }

  void setCategoria(String categoria) {
    this._categoria = categoria;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('calculo', _calculo));
    properties.add(DoubleProperty('peso', _peso));
    properties.add(DoubleProperty('estatura', _estatura));
    properties.add(StringProperty('categoria', _categoria));
  }
}
