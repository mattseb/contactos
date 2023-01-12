final String tableContactos = 'contactos';

class ContactosFields {
  static final List<String> values = [
    /// Add all fields
    id, nombres, apellidos, parentesco, correo, telefono, direccion
  ];
  static final String id = '_id';
  static final String nombres = '_nombres';
  static final String apellidos = '_apellidos';
  static final String parentesco = '_parentesco';
  static final String correo = '_correo';
  static final String telefono = '_telefono';
  static final String direccion = '_direccion';
}

class Contactos {
  final int? id;
  final String nombres;
  final String apellidos;
  final String parentesco;
  final String correo;
  final String telefono;
  final String direccion;

  const Contactos({
    this.id,
    required this.nombres,
    required this.apellidos,
    required this.parentesco,
    required this.correo,
    required this.telefono,
    required this.direccion,
  });

  Contactos copy(
          {int? id,
          String? nombres,
          String? apellidos,
          String? parentesco,
          String? correo,
          String? telefono,
          String? direcccion}) =>
      Contactos(
          id: id ?? this.id,
          nombres: nombres ?? this.nombres,
          apellidos: apellidos ?? this.apellidos,
          parentesco: parentesco ?? this.parentesco,
          correo: correo ?? this.correo,
          telefono: telefono ?? this.telefono,
          direccion: direccion ?? this.direccion);

  static Contactos fromJson(Map<String, Object?> json) => Contactos(
        id: json[ContactosFields.id] as int,
        nombres: json[ContactosFields.nombres] as String,
        apellidos: json[ContactosFields.apellidos] as String,
        parentesco: json[ContactosFields.parentesco] as String,
        correo: json[ContactosFields.correo] as String,
        telefono: json[ContactosFields.telefono] as String,
        direccion: json[ContactosFields.direccion] as String,
      );

  Map<String, Object?> toJson() => {
        ContactosFields.id: id,
        ContactosFields.nombres: nombres,
        ContactosFields.apellidos: apellidos,
        ContactosFields.parentesco: parentesco,
        ContactosFields.correo: correo,
        ContactosFields.telefono: telefono,
        ContactosFields.direccion: direccion,
      };
}
