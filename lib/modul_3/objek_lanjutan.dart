class Mahasiswa {
  String? nama;
  String? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

void main() {
  var mhs = Mahasiswa();
  mhs.nama = "Rendi";
  mhs.tampilkanData();
}