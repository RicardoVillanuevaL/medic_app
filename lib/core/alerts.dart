import 'package:flutter/material.dart';
import 'package:medic_app/values/styles.dart';

class MetricsDialog extends StatelessWidget {
  final String? imc;
  const MetricsDialog({Key? key, this.imc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding:
                const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25),
                Text(
                  'Ya tenemos los resultados!',
                  style: titleLoginStyle,
                ),
                Text(
                    'Su IMC es $imc, lo que indica que su peso está en la categoría de ${categoria()} para adultos de su misma estatura. '),
                Divider(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Aceptar', style: titleLoginStyle))
              ],
            ),
          ),
          Positioned(
              top: -30,
              child: Image.asset(
                imagen(),
                height: 80,
              ))
        ],
      ),
    );
  }

  String imagen() {
    double temp = double.parse(imc!);
    if (temp < 18.5) {
      return 'assets/icons/072-surprised-2.png';
    } else if (temp > 18.5 && temp < 24.9) {
      return 'assets/icons/006-happy-14.png';
    } else if (temp >= 25.0 && temp < 29.9) {
      return 'assets/icons/015-sad-7.png';
    } else {
      return 'assets/icons/058-crying-1.png';
    }
  }

  String categoria() {
    double temp = double.parse(imc!);
    if (temp < 18.5) {
      return 'Bajo peso';
    } else if (temp > 18.5 && temp < 24.9) {
      return 'Normal';
    } else if (temp > 25.0 && temp < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obeso';
    }
  }
}
