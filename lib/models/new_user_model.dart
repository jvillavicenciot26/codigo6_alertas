class NewUserModel {
  NewUserModel({
    required this.id,
    required this.nombreCompleto,
    required this.telefono,
    required this.direccion,
    required this.dni,
    required this.calificacion,
    required this.estado,
  });

  int id;
  String nombreCompleto;
  String telefono;
  String direccion;
  String dni;
  int calificacion;
  String estado;

  factory NewUserModel.fromJson(Map<String, dynamic> json) => NewUserModel(
        id: json["id"],
        nombreCompleto: json["nombreCompleto"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        dni: json["dni"],
        calificacion: json["calificacion"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombreCompleto": nombreCompleto,
        "telefono": telefono,
        "direccion": direccion,
        "dni": dni,
        "calificacion": calificacion,
        "estado": estado,
      };
}
