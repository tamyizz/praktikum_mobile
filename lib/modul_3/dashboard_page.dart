import 'package:flutter/material.dart';
import 'dashboard_repository.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = DashboardRepository();
    final data = repository.getDashboardData();

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(data[index].icon, size: 40, color: Colors.blue),
                  const SizedBox(height: 10),
                  Text(data[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(data[index].value, style: const TextStyle(fontSize: 20)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}