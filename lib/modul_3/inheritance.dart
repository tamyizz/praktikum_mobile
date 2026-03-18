class Manusia {
  String? nama;

  void makan() {
    print('$nama sedang makan.');
  }
}

class Mahasiswa extends Manusia {
  String? nim;

  void belajar() {
    print('$nama dengan NIM $nim sedang belajar.');
  }
}

void main() {
  var mhs = Mahasiswa();
  mhs.nama = "Budi";
  mhs.nim = "123456";
  mhs.makan(); // Memanggil fungsi dari parent
  mhs.belajar();
}