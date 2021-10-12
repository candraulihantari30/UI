import 'package:mobile_desa/Models/jadwal.dart';

class ApiStatic{
  static Future<List<Jadwal>>getJadwal() async{
    List<Jadwal> jadwal=[];
    for (var i = 0; i < 10; i++) {
      jadwal.add(
        Jadwal(
          idKegiatan: i, 
          rencanakerja: "Pembersihan Lingkunan Kantor Adat"+i.toString(), 
          hari: "Jumat dan Minggu Pertama Setiap Bulan",   
          idPelaksana: 1, 
          waktu: "07.30 s.d 90.00 Wita",
          foto: "assets/appimages/sama-sama.jpg",
          createdAt:"", updatedAt: ""
        )
      );
    }
    return jadwal;
  }
}