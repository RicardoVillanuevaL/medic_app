import 'package:flutter/material.dart';
import 'package:medic_app/values/colors.dart';
import 'package:medic_app/values/styles.dart';

class PageViewItem extends StatelessWidget {
  final String title, body;
  final Widget page;
  const PageViewItem(this.title, this.body, this.page);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, textAlign: TextAlign.center, style: titleLoginStyle),
        SizedBox(height: 20),
        Text(body,
            textAlign: TextAlign.center,
            style: TextStyle(color: colorSecondary, fontSize: 16)),
        SizedBox(height: 20),
        page,
      ],
    ));
  }
}
