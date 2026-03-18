void main() {
  List<String> names = ['Alfa', 'beta', 'Charlie'];
  print('Names: $names');

  // Menambahkan data
  names.add('Delta');
  print('Names setelah ditambahkan: $names');

  // mengambil data index tertentu
  print('Elemen pertama: ${names[0]}');
  print('Elemen kedua: ${names[1]}');

  // Mengubah data pada index tertentu
  names[1] = 'Bravo';
  print('Names setelah diubah: $names');

  // Menghapus data dari list
  names.remove('Charlie');
  print('Names setelah dihapus: $names');

  // Menghitung jumlah data dalam list
  print('Jumlah data: ${names.length}');
}