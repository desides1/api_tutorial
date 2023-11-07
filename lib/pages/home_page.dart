import 'package:api_tutorial/providers/mahasiswas.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../pages/detail_player_page.dart';
import '../pages/add_mahasiswa_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool isInit = true;

  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     Provider.of<Mahasiswas>(context).initialData();
  //   }
  //   isInit = false;
  //   super.didChangeDependencies();
  // }

  // @override
  // void dispose() {
  //   isInit = true;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final allMahasiswaProvider = Provider.of<Mahasiswas>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL MAHASISWA"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddMahasiswa.routeName);
            },
          ),
          IconButton(
            icon: Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              allMahasiswaProvider.initialData().then((_) {
                setState(() {});
              });
            },
          ),
        ],
      ),
      body: (allMahasiswaProvider.jumlahMahasiswa == 0)
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Data",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddMahasiswa.routeName);
                    },
                    child: Text(
                      "Add Player",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: allMahasiswaProvider.jumlahMahasiswa,
              itemBuilder: (context, index) {
                var id = allMahasiswaProvider.allMahasiswa[index].id;
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailMahasiswa.routeName,
                      arguments: id,
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      allMahasiswaProvider.allMahasiswa[index].id,
                    ),
                  ),
                  title: Text(
                    allMahasiswaProvider.allMahasiswa[index].name,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(
                        allMahasiswaProvider.allMahasiswa[index].createdAt),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      allMahasiswaProvider.deletePlayer(id).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Berhasil dihapus"),
                          duration: Duration(milliseconds: 500),
                        ));
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
