import 'package:flutter/material.dart';

void main() {
  runApp(KuliahKuApp());
}

class KuliahKuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KULIAHKU',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> jadwal = [
    "Pemrograman Mobile - 08:00",
    "Struktur Data - 10:00",
    "Basis Data - 13:00",
  ];

  TextEditingController controller = TextEditingController();

  void tambahJadwal() {
    if (controller.text.isNotEmpty) {
      setState(() {
        jadwal.add(controller.text);
        controller.clear();
      });
    }
  }

  void hapusJadwal(int index) {
    setState(() {
      jadwal.removeAt(index);
    });
  }

  void editJadwal(int index) {
    controller.text = jadwal[index];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Jadwal"),
        content: TextField(
          controller: controller,
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                jadwal[index] = controller.text;
                controller.clear();
              });
              Navigator.pop(context);
            },
            child: Text("Simpan"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KULIAHKU"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Tambah Jadwal (contoh: Matkul - Jam)",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: tambahJadwal,
            child: Text("Tambah"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: jadwal.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.schedule, color: Colors.blue),
                    title: Text(jadwal[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.orange),
                          onPressed: () => editJadwal(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => hapusJadwal(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}