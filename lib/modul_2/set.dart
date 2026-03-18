void main() {
  Set<int> numbers = {1, 2, 3, 4, 5};
  print('Set: $numbers');

  // Menambahkan data ke dalam set
  numbers.add(6);
  // Menghapus data dari set
  numbers.remove(3);

  print('Set setelah diedit: $numbers');
}