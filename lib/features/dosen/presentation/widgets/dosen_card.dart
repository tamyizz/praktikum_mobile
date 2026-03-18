import 'package:flutter/material.dart';
import '../../data/models/dosen_model.dart';

class DosenCard extends StatelessWidget {
  final DosenModel dosen;
  final VoidCallback? onTap;

  const DosenCard({super.key, required this.dosen, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue.shade700,
                child: Text(
                  dosen.name.substring(0, 1).toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dosen.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("@${dosen.username}", style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                    Text(dosen.email, style: const TextStyle(color: Colors.blue, fontSize: 13)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "${dosen.address.city}, ${dosen.address.street}",
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}