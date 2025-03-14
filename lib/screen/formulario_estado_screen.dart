import 'package:flutter/material.dart';

class FormularioEstadoScreen extends StatefulWidget {
  final String placa;
  const FormularioEstadoScreen({super.key, required this.placa});

  @override
  _FormularioEstadoScreenState createState() => _FormularioEstadoScreenState();
}

class _FormularioEstadoScreenState extends State<FormularioEstadoScreen> {
  String estadoLlantas = "Correcto";
  String estadoChasis = "Correcto";
  String estadoPuertas = "Correcto";
  final TextEditingController observacionesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Estado del Carro: ${widget.placa}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: estadoLlantas,
              decoration: const InputDecoration(labelText: "Estado de Llantas"),
              items: ["Correcto", "Incorrecto"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  estadoLlantas = value!;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: estadoChasis,
              decoration: const InputDecoration(labelText: "Estado del Chasis"),
              items: ["Correcto", "Incorrecto"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  estadoChasis = value!;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: estadoPuertas,
              decoration: const InputDecoration(labelText: "Estado de Puertas"),
              items: ["Correcto", "Incorrecto"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  estadoPuertas = value!;
                });
              },
            ),
            TextField(
              controller: observacionesController,
              decoration: const InputDecoration(labelText: "Observaciones"),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Estado guardado con éxito")),
                );
                Navigator.pop(context);
              },
              child: const Text("Guardar Estado"),
            ),
          ],
        ),
      ),
    );
  }
}
