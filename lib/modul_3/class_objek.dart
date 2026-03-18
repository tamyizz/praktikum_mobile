import 'dart:io';

class Mahasiswa {
  String nama = "Anang";

  void tampilkanData() {
    print(nama);
  }
}

void main() {
  var mahasiswa1 = Mahasiswa();
  mahasiswa1.tampilkanData();

  stdout.write("Masukkan nama baru: ");
  String? namaBaru = stdin.readLineSync();

  if (namaBaru != null && namaBaru.isNotEmpty) {
    mahasiswa1.nama = namaBaru;
    print("Nama berhasil diubah.");
    mahasiswa1.tampilkanData();
  } else {
    print("Nama tidak boleh kosong.");
  }
}