import 'package:flutter/material.dart';
import 'scan_qr_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final String usuario = "Pepe Perez";
  final List<Map<String, String>> carros = [
    {"placa": "ERF888", "conductor": "Juan Carlos", "empresa": "XYZ"},
    {"placa": "ABC123", "conductor": "Maria López", "empresa": "XYZ"},
    {"placa": "XYZ789", "conductor": "Pedro Gómez", "empresa": "XYZ"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carros Eléctricos")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            width: double.infinity,
            child: Text(
              "Usuario: $usuario",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: carros.length,
              itemBuilder: (context, index) {
                final carro = carros[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[300],
                      child: const Center(child: Text("IMG")),
                    ),
                    title: Text("Placa: ${carro['placa']}"),
                    subtitle: Text(
                      "Conductor: ${carro['conductor']}\nEmpresa: ${carro['empresa']}",
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScanQRScreen(),
                          ),
                        );
                      },
                      child: const Text("Escanear QR"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
