import 'package:flutter/material.dart';
import 'package:medic_app/pages/app.dart';
import 'package:medic_app/providers/metrics.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Metrics())],
        child: MyApp()),
  );
}
