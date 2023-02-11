import 'package:anakmuslimapp/domain/entity/anakmuslim_entity.dart';

/// Instance of class [AnakmuslimEntity] which has the role of fetching and parsing data from/to json.

class AnakMuslimModel extends AnakMuslimEntity {
  String keterangan_pengguna;
  String nama_pengguna;
  var id_pengguna;

  /// Fetch data from json format.
  AnakMuslimModel.fromJson(Map<String, dynamic> json)
      : super(
          id_pengguna: json['id_pengguna'],
          nama_pelanggan: json['nama_pengguna'],
          keterangan_pelanggan: json['keterangan_pengguna'],
        );

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'weather': {
          'id_pengguna': id_pengguna,
          'nama_pengguna': nama_pengguna,
          'keterangan_pengguna': keterangan_pengguna,
        },
      };
}
