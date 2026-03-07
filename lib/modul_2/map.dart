import 'dart:io';

void main() {
  // Membuat Map dengan data awal
  Map<String, String> data = {
    'Anang': '081234567890',
    'Arman': '082345678901',
    'Doni': '083456789012',
  };
  print('Data: $data');

  // Tambah data
  data['Rio'] = '084567890123';
  print('data setelah ditambahkan: $data');

  // Tampilkan data berdasarkan key
  print('Nomor Anang: ${data['Anang']}');

  
  // Ubah data
  stdout.write('Masukkan nama yang ingin diubah: ');
  String keyUbah = stdin.readLineSync()!;
  stdout.write('Masukkan nomor baru: ');
  String valueUbah = stdin.readLineSync()!;
  data[keyUbah] = valueUbah;
  print('data setelah diubah: $data');

  // Hapus data
  stdout.write('Masukkan nama yang ingin dihapus: ');
  String keyHapus = stdin.readLineSync()!;
  data.remove(keyHapus);
  print('data setelah dihapus: $data');

  // Cek data berdasarkan key
  stdout.write('Masukkan nama yang ingin dicek: ');
  String keyCek = stdin.readLineSync()!;
  print('Apakah $keyCek ada? ${data.containsKey(keyCek)}');

  // Hitung jumlah data
  print('Jumlah data: ${data.length}');

  // Tampilkan semua key
  print('Semua key: ${data.keys}');

  // Tampilkan semua value
  print('Semua value: ${data.values}');
}