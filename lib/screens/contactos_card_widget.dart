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
  // return GestureDetector(
  //   onTap: () async {
  //     await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => NoteDetailPage(noteId: note.id!),
  //     ));

  //     refreshNotes();
  //   },
  //   child: NoteCardWidget(note: note, index: index),
  // );
  //  onTap: () async {
  //    await Navigator.of(context).push(MaterialPageRoute(
  //      builder: (context) => NoteDetailPage(noteId: note.id!),
  //    ));
  //    }

  //     refreshNotes();
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
          leading: Icon(Icons.person),
          trailing: Text(contacto.parentesco),
          title: Text(
              contacto.nombres +
                  " " +
                  contacto.apellidos +
                  " Dir: " +
                  contacto.direccion,
              style: TextStyle(color: Colors.white)),
          subtitle: Text(
            "Telefono: " + contacto.telefono + " * email: " + contacto.correo,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
