import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(const CarrosElectricosApp());
}

class CarrosElectricosApp extends StatelessWidget {
  const CarrosElectricosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gestión de Carros Eléctricos",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

