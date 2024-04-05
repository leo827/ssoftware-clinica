import 'package:flutter/material.dart';
import 'package:software_clinico/pages/ContactoForm.dart';
import 'package:software_clinico/pages/DatosPersonalesForm.dart';
import 'package:software_clinico/pages/DireccionForm.dart';

class IngresoPaciente extends StatefulWidget {
  const IngresoPaciente({Key? key}) : super(key: key);

  @override
  _IngresoPacienteState createState() => _IngresoPacienteState();
}

class _IngresoPacienteState extends State<IngresoPaciente> {
  final Color principalColor = const Color.fromARGB(255, 0, 205, 231);

  void guardarFormulario() {
    // Lógica para guardar el formulario
    print('Formulario guardado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ingreso de Paciente',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: principalColor,
      ),
      body: DefaultTabController(
        length: 3, // Número total de pestañas
        child: Scaffold(
          appBar: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Datos Personales'),
              Tab(text: 'Dirección'),
              Tab(text: 'Contacto'),
            ],
            indicatorColor: principalColor,
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: DatosPersonalesForm(),
              ),
              SingleChildScrollView(
                child: DireccionForm(),
              ),
              SingleChildScrollView(
                child: ContactoForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
