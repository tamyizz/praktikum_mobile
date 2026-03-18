import 'package:flutter/material.dart';
import '../widgets/mahasiswa_card.dart';
import '../../data/models/mahasiswa_model.dart';
import '../../data/repositories/mahasiswa_repository.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  final MahasiswaRepository _repository = MahasiswaRepository();
  late Future<List<MahasiswaModel>> _futureMahasiswa;

  @override
  void initState() {
    super.initState();
    _futureMahasiswa = _repository.getMahasiswaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Mahasiswa (Comments API)"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<MahasiswaModel>>(
        future: _futureMahasiswa,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final listMahasiswa = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: listMahasiswa.length,
            itemBuilder: (context, index) {
              final mhs = listMahasiswa[index];
              return MahasiswaCard(mahasiswa: mhs);
            },
          );
        },
      ),
    );
  }
}
