import 'package:flutter/material.dart';

class FormularioCategoria extends StatefulWidget {
  @override
  _FormularioCategoriaState createState() => _FormularioCategoriaState();
}

class _FormularioCategoriaState extends State<FormularioCategoria> {
  final _formKey = GlobalKey<FormState>();
  String categoria = '';
  String imagen = '';
  String estado = 'on'; // Asumiendo 'on' como valor predeterminado

  Future<void> crearCategoria() async {
    if (_formKey.currentState!.validate()) {
      // Aquí va la lógica para enviar los datos a tu API
      // Ejemplo:
      // await http.post('tu_endpoint', body: {
      //   'categoria': categoria,
      //   'imagen': imagen,
      //   'estado': estado,
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Categoría'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un nombre para la categoría';
              }
              return null;
            },
            onSaved: (value) => categoria = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Imagen (URL)'),
            onSaved: (value) => imagen = value!,
          ),
          DropdownButtonFormField(
            value: estado,
            items: [
              DropdownMenuItem(value: 'on', child: Text('Activo')),
              DropdownMenuItem(value: 'off', child: Text('Inactivo')),
            ],
            onChanged: (String? newValue) {
              setState(() {
                estado = newValue!;
              });
            },
          ),
          ElevatedButton(
            onPressed: crearCategoria,
            child: Text('Crear Categoría'),
          ),
        ],
      ),
    );
  }
}
