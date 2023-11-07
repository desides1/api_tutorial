import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/mahasiswas.dart';

class AddMahasiswa extends StatelessWidget {
  static const routeName = "/add-mahasiswa";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mahasiswas = Provider.of<Mahasiswas>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD Mahasiswa"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              mahasiswas.AddMahasiswa(
                nameController.text,
                positionController.text,
                imageController.text,
              ).then(
                (response) {
                  print("Kembali ke Home & kasih notif snack bar");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berhasil ditambahkan"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "nim"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "kelas"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  mahasiswas.AddMahasiswa(
                    nameController.text,
                    positionController.text,
                    imageController.text,
                  ).then(
                    (response) {
                      print("Kembali ke Home & kasih notif snack bar");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil ditambahkan"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    mahasiswas.AddMahasiswa(
                      nameController.text,
                      positionController.text,
                      imageController.text,
                    ).then(
                      (response) {
                        print("Kembali ke Home & kasih notif snack bar");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil ditambahkan"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
