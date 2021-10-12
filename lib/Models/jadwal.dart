class Jadwal{
  Jadwal({
      required this.idKegiatan,
      required this.rencanakerja,
      required this.hari,
      required this.idPelaksana,
      required this.waktu,
      required this.foto,
      required this.createdAt,
      required this.updatedAt,
  });
    int idKegiatan;
    String rencanakerja;
    String hari;
    int idPelaksana;
    String waktu;
    String foto;
    String createdAt;
    String updatedAt;

    factory Jadwal.fromJson(Map<String, dynamic> json) =>Jadwal(
      idKegiatan: json["id_kegiatan"],
      rencanakerja: json["rencanakerja"].toString(),
      hari: json["hari"].toString(),
      idPelaksana: json["Id_pelaksana"],
      waktu: json["waktu"].toString(),
      foto: json["foto"].toString(),
      createdAt: json["created_At"].toString(),
      updatedAt: json["updated_At"].toString(),
    );
}