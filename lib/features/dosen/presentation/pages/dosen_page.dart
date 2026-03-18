import 'package:flutter/material.dart';
import '../../data/models/dosen_model.dart';
import '../../data/repositories/dosen_repository.dart';
import '../widgets/dosen_card.dart'; // INI IMPORTNYA

class DosenPage extends StatefulWidget {
  const DosenPage({super.key});

  @override
  State<DosenPage> createState() => _DosenPageState();
}

class _DosenPageState extends State<DosenPage> {
  final DosenRepository _repository = DosenRepository();
  late Future<List<DosenModel>> _futureDosen;

  @override
  void initState() {
    super.initState();
    _futureDosen = _repository.getDosenList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Dosen (API)"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<DosenModel>>(
        future: _futureDosen,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final listDosen = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: listDosen.length,
              itemBuilder: (context, index) {
                // SEKARANG MEMANGGIL WIDGET DARI FILE TERPISAH
                return DosenCard(dosen: listDosen[index]); 
              },
            );
          }
          return const Center(child: Text("Tidak ada data"));
        },
      ),
    );
  }
}