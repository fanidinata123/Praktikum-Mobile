import 'dart:io';

void main() {
  // Data awal
  List<String> names = ['Alfa', 'beta', 'Charlie'];
  print('Names: $names');

  // Tambah data
  names.add('Delta');
  print('Names setelah ditambahkan: $names');

  // Tampilkan index tertentu
  print('Elemen pertama: ${names[0]}');
  print('Elemen kedua: ${names[1]}');

  // Ubah data pada index tertentu
  names[1] = 'Bravo';
  print('Names setelah diubah: $names');

  // Hapus data tertentu
  names.remove('Charlie');
  print('Names setelah dihapus: $names');

  // Hitung jumlah data
  print('Jumlah data: ${names.length}');

  // Looping semua data
  print('Menampilkan setiap elemen:');
  for (String name in names) {
    print(name);
  }
}