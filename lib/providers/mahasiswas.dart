import 'dart:convert';

import 'package:api_tutorial/pages/add_mahasiswa_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/mahasiswa.dart';

class Mahasiswas with ChangeNotifier {
  List<Mahasiswa> _allMahasiswa = [];

  List<Mahasiswa> get allMahasiswa => _allMahasiswa;

  int get jumlahMahasiswa => _allMahasiswa.length;

  Mahasiswa selectById(String id) =>
      _allMahasiswa.firstWhere((element) => element.id == id);

  Future<void> AddMahasiswa(String name, String nim, String kelas) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://ayo-curhat-3b698-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "name": name,
          "nim": nim,
          "kelas": kelas,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _allMahasiswa.add(
          Mahasiswa(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            nim: nim,
            kelas: kelas,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editPlayer(
    String id,
    String name,
    String nim,
    String kelas,
  ) {
    Uri url = Uri.parse(
        "https://ayo-curhat-3b698-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa/$id.json");
    return http
        .patch(
      url,
      body: json.encode(
        {
          "name": name,
          "nim": nim,
          "kelas": kelas,
        },
      ),
    )
        .then(
      (response) {
        Mahasiswa selectPlayer =
            _allMahasiswa.firstWhere((element) => element.id == id);
        selectPlayer.name = name;
        selectPlayer.nim = nim;
        selectPlayer.kelas = kelas;

        notifyListeners();
      },
    );
  }

  Future<void> deletePlayer(String id) {
    Uri url = Uri.parse(
        "https://ayo-curhat-3b698-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa/$id.json");
    return http.delete(url).then(
      (response) {
        _allMahasiswa.removeWhere((element) => element.id == id);

        notifyListeners();
      },
    );
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://ayo-curhat-3b698-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa/.json");
    http.get(url).then((value) => print(value.body));

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    dataResponse.forEach(
      (key, value) {
        DateTime dateTimeParse =
            DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
        _allMahasiswa.add(
          Mahasiswa(
              nim: value["nim"],
              id: key,
              kelas: value["kelas"],
              name: value["name"],
              createdAt: dateTimeParse),
        );
      },
    );
    print("Data Berhasil ditambahkan");

    notifyListeners();
  }
}


    // ======
