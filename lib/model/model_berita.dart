// To parse this JSON data, do
//
//     final modelBerita = modelBeritaFromJson(jsonString);

import 'dart:convert';

ModelBerita modelBeritaFromJson(String str) =>
    ModelBerita.fromJson(json.decode(str));

String modelBeritaToJson(ModelBerita data) => json.encode(data.toJson());

class ModelBerita {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelBerita({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelBerita.fromJson(Map<String, dynamic> json) => ModelBerita(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String judul;
  String konten;
  String gambar;
  DateTime created;

  Datum({
    required this.id,
    required this.judul,
    required this.konten,
    required this.gambar,
    required this.created,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        judul: json["judul"],
        konten: json["konten"],
        gambar: json["gambar"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "konten": konten,
        "gambar": gambar,
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
      };
}