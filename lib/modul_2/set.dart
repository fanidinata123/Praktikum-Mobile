import 'dart:io';

void main() {
  // Membuat Set dengan data awal
  Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};
  print('Burung: $burung');

  // Tambah data
  stdout.write('Tambah burung baru: ');
  String tambah = stdin.readLineSync()!;
  burung.add(tambah);
  print('Setelah ditambah: $burung');

  // Tambah data duplicate
  stdout.write('Tambah data duplikat: ');
  String duplikat = stdin.readLineSync()!;
  burung.add(duplikat);
  print('Setelah tambah duplikat: $burung');

  // Hapus data
  stdout.write('Masukkan burung yang ingin dihapus: ');
  String hapus = stdin.readLineSync()!;
  burung.remove(hapus);
  print('Setelah dihapus: $burung');

  // Cek data
  stdout.write('Cek burung yang ingin dicari: ');
  String cek = stdin.readLineSync()!;
  print('Apakah $cek ada? ${burung.contains(cek)}');

  // Hitung jumlah data
  print('Jumlah data: ${burung.length}');
}
