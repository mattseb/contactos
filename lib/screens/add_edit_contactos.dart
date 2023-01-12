import 'package:contactos/db/contactos_database.dart';
import 'package:contactos/model/contactos.dart';
import 'package:contactos/screens/contactos_form_widget.dart';
import 'package:flutter/material.dart';

class AddEditContactos extends StatefulWidget {
  final Contactos? contacto;

  const AddEditContactos({
    Key? key,
    this.contacto,
  }) : super(key: key);
  @override
  _AddEditContactosState createState() => _AddEditContactosState();
}

class _AddEditContactosState extends State<AddEditContactos> {
  final _formKey = GlobalKey<FormState>();
  late String nombres;
  late String apellidos;
  late String? parentesco = "Seleciona Valor";
  late String correo;
  late String telefono;
  late String direccion;

  @override
  void initState() {
    super.initState();

    nombres = widget.contacto?.nombres ?? "";
    apellidos = widget.contacto?.apellidos ?? "";
    // parentesco = widget.contacto?.parentesco ?? "";
    correo = widget.contacto?.correo ?? "";
    telefono = widget.contacto?.telefono ?? "";
    direccion = widget.contacto?.direccion ?? "";
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: ContactosFormWidget(
            nombres: nombres,
            apellidos: apellidos,
            parentesco: parentesco!,
            correo: correo,
            telefono: telefono,
            direccion: direccion,
            onChangedNombres: (nombres) =>
                setState(() => this.nombres = nombres),
            onChangedApellidos: (apellidos) =>
                setState(() => this.apellidos = apellidos),
            onChangedParentesco: (parentesco) =>
                setState(() => this.parentesco = parentesco),
            onChangedCorreo: (correo) => setState(() => this.correo = correo),
            onChangedTelefono: (telefono) =>
                setState(() => this.telefono = telefono),
            onChangedDireccion: (direccion) =>
                setState(() => this.direccion = direccion),
          ),
        ),
      );

  // void Function(String?) onChangedParentescoWithNull = (String? parentesco) {
  //   setState(() => this.parentesco = parentesco ?? "");
  // };

  Widget buildButton() {
    final isFormValid = nombres.isNotEmpty &&
        apellidos.isNotEmpty &&
        parentesco!.isNotEmpty &&
        correo.isNotEmpty &&
        telefono.isNotEmpty &&
        direccion.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        onPressed: addOrUpdateContactos,
        child: Text('Guardar'),
      ),
    );
  }

  void addOrUpdateContactos() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.contacto != null;

      if (isUpdating) {
        await updateContacto();
      } else {
        await addContactos();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateContacto() async {
    final note = widget.contacto!.copy(
      nombres: nombres,
      apellidos: apellidos,
      parentesco: parentesco,
      correo: correo,
      telefono: telefono,
      direcccion: direccion,
    );

    await ContactosDatabase.instance.update(note);
  }

  Future addContactos() async {
    final contacto = Contactos(
        nombres: nombres,
        apellidos: apellidos,
        parentesco: parentesco!,
        correo: correo,
        telefono: telefono,
        direccion: direccion);

    await ContactosDatabase.instance.create(contacto);
  }
}
