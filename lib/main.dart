import 'package:api_tutorial/providers/mahasiswas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/mahasiswas.dart';
import './pages/detail_player_page.dart';
import './pages/add_mahasiswa_page.dart';
import './pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Mahasiswas(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          AddMahasiswa.routeName: (context) => AddMahasiswa(),
          DetailMahasiswa.routeName: (context) => DetailMahasiswa(),
        },
      ),
    );
  }
}
