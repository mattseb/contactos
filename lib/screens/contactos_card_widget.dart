import 'package:contactos/model/contactos.dart';
import 'package:contactos/screens/contactos_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _lightColors = [Colors.blue[800], Colors.purple[900]];

class ContactosCardWidget extends StatelessWidget {
  ContactosCardWidget({
    Key? key,
    required this.contacto,
    required this.index,
  }) : super(key: key);

  final Contactos contacto;
  final int index;
  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    return Container(
      color: _lightColors[index % _lightColors.length],
      child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactoDetail(contactoId: contacto.id!),
          ));
        },
        child: ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.white,
          ),
          trailing: Text(
            contacto.parentesco,
            style: TextStyle(color: Colors.white),
          ),
          title: Text(contacto.nombres + " " + contacto.apellidos,
              style: TextStyle(color: Colors.white)),
          subtitle: Text(
            "Telefono: " + contacto.telefono,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
