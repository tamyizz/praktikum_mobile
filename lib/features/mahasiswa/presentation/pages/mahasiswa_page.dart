import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mahasiswa_provider.dart';
import '../../../dosen/presentation/providers/dosen_provider.dart';
import '../../../dosen/presentation/widgets/dosen_widget.dart'; // Re-use SavedUserSection

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);
    final savedUsers = ref.watch(savedUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa (Comments API)'),
        backgroundColor: Colors.green.shade100,
      ),
      body: Column(
        children: [
          // Bagian Data Tersimpan (Konsisten dengan Dosen)
          SavedUserSection(savedUsers: savedUsers, ref: ref),
          
          const Divider(),
          
          // Daftar Mahasiswa dari API
          Expanded(
            child: mahasiswaState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (list) => ListView.builder(
                itemCount: list.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final mhs = list[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(mhs.id.toString(), style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text(mhs.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("${mhs.email}\n${mhs.body}"),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(Icons.save_alt, color: Colors.green),
                        onPressed: () async {
                          await ref.read(mahasiswaNotifierProvider.notifier).saveMahasiswa(mhs);
                          ref.invalidate(savedUsersProvider); // Update UI
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Mahasiswa berhasil disimpan!')),
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}