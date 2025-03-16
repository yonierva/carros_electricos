import 'dart:math';

import 'package:flutter/material.dart';
import 'scan_qr_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      FocusScope.of(context).unfocus(); // Oculta el teclado
    },child: Scaffold(
      resizeToAvoidBottomInset: false, // Evita que la UI se reacomode lentamente
      appBar: AppBar(title: const Text("Inicio de Sesion", style: TextStyle(color: Colors.blue, fontSize: 30 )), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: user,
                  decoration: InputDecoration(
                    labelText: "Usuario",
                    hintText: "Ingrese su nombre",
                    icon: Icon(Icons.person)
                  ),
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    hintText: "Ingrese una contraseña",
                    icon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    elevation: 10,
                  ),
                  onPressed: () {
                    if(user.text.isNotEmpty && password.text.isNotEmpty){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScanQRScreen()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('bienvenido ${user.text}')
                      ),
                    );
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Por favor llene los campos'), duration: Duration(seconds: 2),)
                      );
                    }
                  },
                  child: Text("Iniciar Sesion"),
                )
              ],
            ) 
          )
        )
      )
    )
    );
  }              
}