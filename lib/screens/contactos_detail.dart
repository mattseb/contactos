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
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      contacto.nombres,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      contacto.apellidos,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      contacto.parentesco,
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditContactos(contacto: contacto),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await ContactosDatabase.instance.delete(widget.contactoId);

          Navigator.of(context).pop();
        },
      );
}
