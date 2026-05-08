import 'package:flutter/material.dart';

void main() {
  runApp(const KuliahKuApp());
}

class KuliahKuApp extends StatelessWidget {
  const KuliahKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KuliahKu',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class Jadwal {
  final String matkul;
  final String dosen;
  final String jam;
  final String ruangan;

  Jadwal(this.matkul, this.dosen, this.jam, this.ruangan);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<String> hari = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat"
  ];

  final Map<String, List<Jadwal>> data = {
    "Senin": [
      Jadwal("Struktur Data", "Pak Ahmad", "08:00 - 10:00", "Lab 1"),
      Jadwal("Mobile Programming", "Bu Rina", "10:00 - 12:00", "A2"),
    ],
    "Selasa": [
      Jadwal("Kecerdasan Buatan", "Pak Yusuf", "09:00 - 11:00", "Lab AI"),
    ],
    "Rabu": [
      Jadwal("Basis Data", "Pak Budi", "08:00 - 10:00", "Ruang 3"),
    ],
    "Kamis": [
      Jadwal("UI/UX Design", "Bu Sari", "13:00 - 15:00", "Lab Design"),
    ],
    "Jumat": [
      Jadwal("Pemrograman Web", "Pak Dedi", "08:00 - 10:00", "Lab Web"),
    ],
  };

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: hari.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KuliahKu"),
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: hari.map((e) => Tab(text: e)).toList(),
        ),
      ),

      body: TabBarView(
        controller: tabController,
        children: hari.map((h) {
          final list = data[h]!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (context, i) {
              final item = list[i];

              return Container(
                margin: const EdgeInsets.only(bottom: 12),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo.shade400,
                      Colors.indigo.shade700
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    )
                  ],
                ),

                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),

                  title: Text(
                    item.matkul,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dosen: ${item.dosen}",
                            style: const TextStyle(color: Colors.white70)),
                        Text("Jam: ${item.jam}",
                            style: const TextStyle(color: Colors.white70)),
                        Text("Ruangan: ${item.ruangan}",
                            style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),

                  trailing: const Icon(
                    Icons.schedule,
                    color: Colors.white,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}