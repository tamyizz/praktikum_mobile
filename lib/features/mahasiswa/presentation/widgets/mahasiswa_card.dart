import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_model.dart';

class MahasiswaCard extends StatelessWidget {
  final MahasiswaModel mahasiswa;
  const MahasiswaCard({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: Text(mahasiswa.name[0].toUpperCase(), 
                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mahasiswa.name, 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(mahasiswa.email, 
                    style: const TextStyle(color: Colors.blue, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(mahasiswa.body, 
                    maxLines: 2, overflow: TextOverflow.ellipsis, 
                    style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}