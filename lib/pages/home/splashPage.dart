import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_app/pages/home/calculatorPage.dart';
import 'package:medic_app/pages/widgets/pageViewItem.dart';
import 'package:medic_app/values/colors.dart';
import 'package:medic_app/values/styles.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<PageViewItem> listPagesViewModel = [
    PageViewItem(
        'CalculatorIMC,\nBienvenido!',
        'Sistema metrico para adultos',
        Center(
          child: Image.asset('assets/images/Doctor.png', height: 250),
        )),
    PageViewItem(
        'CalculatorIMC,\nBienvenido!',
        'Sistema metrico para adultos',
        Center(
          child: Image.asset('assets/images/doctor2.png', height: 250),
        )),
    PageViewItem(
        'CalculatorIMC,\nBienvenido!',
        'Sistema metrico para adultos',
        Center(
          child: Image.asset('assets/images/doctor3.png', height: 250),
        )),
  ];

  var controller = PageController(initialPage: 0);
  int page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
          top: 30,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => CalculatorIMCPage()),
                  (route) => false);
            },
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text('Skip', style: titleLoginStyle),
              Icon(Icons.chevron_right, color: colorBlue1, size: 30)
            ]),
          )),
      PageView(
        children: listPagesViewModel,
        onPageChanged: (val) {
          setState(() {
            page = val;
          });
        },
        controller: controller,
      ),
      Positioned(
          bottom: 50,
          left: 40,
          right: 40,
          child: InkWell(
            onTap: () {
              if (page == 2) {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => CalculatorIMCPage()),
                    (route) => false);
              } else {
                setState(() {
                  controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear);
                });
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                page == 2 ? 'Comencemos' : 'Siguiente',
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
            ),
          ))
    ]));
  }
}
