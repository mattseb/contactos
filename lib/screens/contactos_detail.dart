import 'package:contactos/db/contactos_database.dart';
import 'package:contactos/model/contactos.dart';
import 'package:contactos/screens/add_edit_contactos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContactoDetail extends StatefulWidget {
  final int contactoId;

  const ContactoDetail({
    Key? key,
    required this.contactoId,
  }) : super(key: key);

  @override
  _ContactoDetailState createState() => _ContactoDetailState();
}

class _ContactoDetailState extends State<ContactoDetail> {
  late Contactos contacto;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.contacto =
        await ContactosDatabase.instance.readContactos(widget.contactoId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Datos del contacto"),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  height: 300,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      children: [
                        Text(
                          contacto.nombres + " " + contacto.apellidos,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            Text(
                              contacto.parentesco,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            Text(
                              contacto.telefono,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            Text(
                              contacto.correo,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Icon(
                              Icons.house,
                              color: Colors.white,
                            ),
                            Text(
                              contacto.direccion,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
}
