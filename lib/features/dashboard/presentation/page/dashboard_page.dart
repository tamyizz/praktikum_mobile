import 'package:flutter/material.dart';
import '../../../dosen/presentation/pages/dosen_page.dart';
import '../../../mahasiswa/presentation/pages/mahasiswa_page.dart';
import '../../../profile/presentation/page/profile_page.dart';
import '../../../mahasiswa_aktif/presentation/pages/mahasiswa_aktif_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                "Smart Campus",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black26,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1e3c72), Color(0xFF2a5298)],
                  ),
                ),
                child: Opacity(
                  opacity: 0.1,
                  child: const Icon(
                    Icons.school,
                    size: 150,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              delegate: SliverChildListDelegate([
                _buildMenuCard(
                  context,
                  "Data Dosen",
                  Icons.school,
                  Colors.orange,
                  const DosenPage(),
                ),
                _buildMenuCard(
                  context,
                  "Mahasiswa",
                  Icons.people,
                  Colors.green,
                  MahasiswaPage(),
                ),
                _buildMenuCard(
                  context,
                  "Profil",
                  Icons.person_pin,
                  Colors.teal,
                  const ProfilePage(),
                ),
                _buildMenuCard(
                  context,
                  "Mahasiswa Aktif",
                  Icons.person_pin_rounded,
                  Colors.purple,
                  MahasiswaAktifPage(),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget? page,
  ) {
    return InkWell(
      onTap: () => page != null
          ? Navigator.push(context, MaterialPageRoute(builder: (c) => page))
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
