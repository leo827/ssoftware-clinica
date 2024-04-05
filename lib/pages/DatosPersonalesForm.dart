import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importamos para formatear fechas
import 'package:software_clinico/pages/IngresoCampo%20.dart';

class DatosPersonalesForm extends StatefulWidget {
  @override
  _DatosPersonalesFormState createState() => _DatosPersonalesFormState();
}

class _DatosPersonalesFormState extends State<DatosPersonalesForm> {
  TextEditingController numeroDocumentoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController identidadGeneroController = TextEditingController();
  TextEditingController fechaNacimientoController = TextEditingController();
  TextEditingController edadController = TextEditingController();
  TextEditingController tipoEdadController = TextEditingController();

  final Color principalColor = const Color.fromARGB(255, 0, 205, 231);
  final Color colorFondo = const Color(0xFFF7F9FC);
  final TextStyle estiloTextRegular =
      const TextStyle(fontWeight: FontWeight.w400, fontFamily: 'FiraSans');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          IngresoCampo(
            controller: numeroDocumentoController,
            labelText: 'No. Documento',
            estiloText: estiloTextRegular,
            colorFondo: colorFondo,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: IngresoCampo(
                  controller: nombreController,
                  labelText: 'Nombre',
                  estiloText: estiloTextRegular,
                  colorFondo: colorFondo,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: IngresoCampo(
                  controller: apellidoController,
                  labelText: 'Apellido',
                  estiloText: estiloTextRegular,
                  colorFondo: colorFondo,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            value: null,
            items: [
              DropdownMenuItem(
                value: 'Masculino',
                child: Text(
                  'Masculino',
                  style: estiloTextRegular,
                ),
              ),
              DropdownMenuItem(
                value: 'Femenino',
                child: Text(
                  'Femenino',
                  style: estiloTextRegular,
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                identidadGeneroController.text = value!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Identidad de Género',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Bordes circulares
                borderSide: BorderSide(
                  color: principalColor, // Color de la línea del borde
                ),
              ),
              labelStyle: estiloTextRegular,
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: fechaNacimientoController,
            decoration: InputDecoration(
              labelText: 'Fecha de Nacimiento',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Bordes circulares
                borderSide: BorderSide(
                  color: principalColor, // Color de la línea del borde
                ),
              ),
              labelStyle: estiloTextRegular,
            ),
            onTap: () async {
              // Abrir un selector de fecha
              DateTime? fechaSeleccionada = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (fechaSeleccionada != null) {
                // Actualizar el controlador de fecha de nacimiento
                fechaNacimientoController.text =
                    DateFormat('yyyy-MM-dd').format(fechaSeleccionada);
                // Calcular y actualizar la edad
                calcularEdad(fechaSeleccionada);
              }
            },
          ),
          const SizedBox(height: 15),
          IngresoCampo(
            controller: edadController,
            labelText: 'Edad',
            enabled: false, // No editable por el usuario
            estiloText: estiloTextRegular,
            colorFondo: colorFondo,
          ),
          const SizedBox(height: 15),
          IngresoCampo(
            controller: tipoEdadController,
            labelText: 'Tipo de Edad (años, meses, días)',
            estiloText: estiloTextRegular,
            colorFondo: colorFondo,
          ),
        ],
      ),
    );
  }

  void calcularEdad(DateTime fechaNacimiento) {
    DateTime ahora = DateTime.now();
    int edad = ahora.year - fechaNacimiento.year;
    if (ahora.month < fechaNacimiento.month ||
        (ahora.month == fechaNacimiento.month &&
            ahora.day < fechaNacimiento.day)) {
      edad--;
    }
    setState(() {
      edadController.text = edad.toString();
    });
  }
}
