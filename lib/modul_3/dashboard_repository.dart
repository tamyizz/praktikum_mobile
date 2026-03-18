import 'package:flutter/material.dart';
import 'dashboard_model.dart';

class DashboardRepository {
  List<DashboardData> getDashboardData() {
    return [
      DashboardData(title: "Total Mahasiswa", value: "120", icon: Icons.people),
      DashboardData(title: "Total Jurusan", value: "5", icon: Icons.school),
      DashboardData(title: "Kehadiran Hari Ini", value: "95%", icon: Icons.assignment_turned_in),
    ];
  }
}
