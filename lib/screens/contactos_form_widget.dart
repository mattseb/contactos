import 'package:flutter/material.dart';

class ContactosFormWidget extends StatelessWidget {
  final String nombres;
  final String apellidos;
  final String parentesco;
  final String correo;
  final String telefono;
  final String direccion;
  final ValueChanged<String> onChangedNombres;
  final ValueChanged<String> onChangedApellidos;
  final ValueChanged<String?>? onChangedParentesco;
  final ValueChanged<String> onChangedCorreo;
  final ValueChanged<String> onChangedTelefono;
  final ValueChanged<String> onChangedDireccion;

  const ContactosFormWidget(
      {Key? key,
      this.nombres = '',
      this.apellidos = '',
      this.parentesco = 'Seleccione Valor',
      this.correo = '',
      this.telefono = '',
      this.direccion = '',
      required this.onChangedNombres,
      required this.onChangedApellidos,
      required this.onChangedParentesco,
      required this.onChangedCorreo,
      required this.onChangedTelefono,
      required this.onChangedDireccion})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildNombre(),
              SizedBox(height: 8),
              buildApellidos(),
              SizedBox(height: 8),
              buildParentesco(),
              SizedBox(height: 8),
              buildCorreo(),
              SizedBox(height: 8),
              buildTelefono(),
              SizedBox(height: 8),
              buildDireccion(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildNombre() => TextFormField(
        maxLines: 1,
        initialValue: nombres,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese sus nombres',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (nombres) => nombres != null && nombres.isEmpty
            ? 'El nombre no debe estar vacio'
            : null,
        onChanged: onChangedNombres,
      );

  Widget buildApellidos() => TextFormField(
        maxLines: 1,
        initialValue: apellidos,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese sus apellidos',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (apellidos) => apellidos != null && apellidos.isEmpty
            ? 'El apellido no debe estar vacio'
            : null,
        onChanged: onChangedApellidos,
      );

  Widget buildParentesco() => DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: 'Selecciona una opcion'),
        items: [
          DropdownMenuItem(
            child: Text("Seleciona Valor"),
            value: "Seleciona Valor",
          ),
          DropdownMenuItem(
            child: Text('Familia'),
            value: 'Familia',
          ),
          DropdownMenuItem(
            child: Text('Amigo'),
            value: 'Amigo',
          ),
          DropdownMenuItem(
            child: Text('Conocido'),
            value: 'Conocido',
          ),
        ],
        onChanged: onChangedParentesco,
        value: parentesco,
      );
  Widget buildCorreo() => TextFormField(
        maxLines: 1,
        initialValue: correo,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese su correo',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (correo) => correo != null && correo.isEmpty
            ? 'El correo no debe estar vacio'
            : null,
        onChanged: onChangedCorreo,
      );

  Widget buildTelefono() => TextFormField(
        maxLines: 1,
        initialValue: telefono,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese su telefono',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (telefono) => telefono != null && telefono.isEmpty
            ? 'El telefono no debe estar vacio'
            : null,
        onChanged: onChangedTelefono,
      );

  Widget buildDireccion() => TextFormField(
        maxLines: 1,
        initialValue: direccion,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Ingrese su direccion',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (direccion) => direccion != null && direccion.isEmpty
            ? 'La direccion no debe estar vacio'
            : null,
        onChanged: onChangedDireccion,
      );
}
