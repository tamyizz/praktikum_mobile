import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_aktif_model.dart';
import '../../data/repositories/mahasiswa_aktif_repository.dart';
import '../widgets/mahasiswa_aktif_card.dart';

class MahasiswaAktifPage extends StatefulWidget {
  const MahasiswaAktifPage({super.key});

  @override
  State<MahasiswaAktifPage> createState() => _MahasiswaAktifPageState();
}

class _MahasiswaAktifPageState extends State<MahasiswaAktifPage> {
  final MahasiswaAktifRepository _repository = MahasiswaAktifRepository();
  late Future<List<MahasiswaAktifModel>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = _repository.getMahasiswaAktifList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahasiswa Aktif (Posts API)"),
        backgroundColor: Colors.purple, // Warna berbeda agar mudah dibedakan
      ),
      body: FutureBuilder<List<MahasiswaAktifModel>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final listData = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: listData.length,
            itemBuilder: (context, index) {
              final item = listData[index];
              return MahasiswaAktifCard(mahasiswaAktif: item);
            },
          );
        },
      ),
    );
  }
}
