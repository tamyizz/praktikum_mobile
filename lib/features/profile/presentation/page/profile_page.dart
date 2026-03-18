import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Saya"), elevation: 0),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?u=me",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ulik Ulala",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Developer & Student",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("ulala@vokasi.id"),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text("Telepon"),
            subtitle: Text("+62 812 3456 789"),
          ),
        ],
      ),
    );
  }
}
