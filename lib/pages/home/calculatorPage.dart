import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medic_app/core/alerts.dart';
import 'package:medic_app/values/styles.dart';

class CalculatorIMCPage extends StatefulWidget {
  CalculatorIMCPage({Key? key}) : super(key: key);

  @override
  _CalculatorIMCPageState createState() => _CalculatorIMCPageState();
}

class _CalculatorIMCPageState extends State<CalculatorIMCPage> {
  String? datos;
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final key = GlobalObjectKey<FormState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: 30,
                          left: 10,
                          child:
                              Icon(Icons.menu, size: 30, color: Colors.white)),
                      Positioned(
                        bottom: 30,
                        child: Text(
                          'CALCULATOR IMC\nSISTEMA MÉTRICO',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: gradientPrimary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                )
              ],
            ),
            Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text('Metricas', style: titleLoginStyle)),
                    InputMetric(
                        edit: TextFormField(
                          controller: age,
                          keyboardType: TextInputType.phone,
                        ),
                        image: 'assets/icons/age.png',
                        text: 'AÑOS'),
                    InputMetric(
                        edit: TextFormField(
                          controller: height,
                          keyboardType: TextInputType.phone,
                        ),
                        image: 'assets/icons/height.png',
                        text: 'CM'),
                    InputMetric(
                        edit: TextFormField(
                          controller: weight,
                          keyboardType: TextInputType.phone,
                        ),
                        image: 'assets/icons/weight.png',
                        text: 'KG'),
                    GestureDetector(
                        onTap: () {
                          if (weight.text.isNotEmpty &&
                              height.text.isNotEmpty) {
                            calcular();
                          } else {
                            print('error');
                          }
                        },
                        child: ButtonGradient(text: 'CALCULAR')),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  calcular() {
    setState(() {
      double resultado =
          double.parse(weight.text) / pow(double.parse(height.text), 2);
      datos = resultado.toStringAsFixed(2);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MetricsDialog(imc: datos);
        },
      );
      print(
          datos); // aca tienes el puto dato imprimiendo no me jodas ctm muestralo bonito
    });
  }
}

class ButtonGradient extends StatelessWidget {
  final String? text;
  final Function? fun;
  const ButtonGradient({this.text, this.fun});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '$text',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: gradientPrimary),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    );
  }
}

class InputMetric extends StatelessWidget {
  final String? image, text;
  final TextFormField? edit;
  const InputMetric({this.edit, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              child: Image.asset(
                image!,
                height: 40,
              ),
              backgroundColor: Colors.white,
              radius: 26,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 200,
              child: edit,
            ),
            Text(text!),
          ],
        ),
      ),
    );
  }
}
