import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/dashboard/presentation/page/dashboard_page.dart'; // Import dashboard lamamu

void main() {
  runApp(
    // ProviderScope harus tetap ada di paling atas
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // Kembalikan ke DashboardPage supaya menu utama muncul
      home: const DashboardPage(),
    );
  }
}