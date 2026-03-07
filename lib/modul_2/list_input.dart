import 'dart:io';

void main() {
  // Membuat list kosong
  List<String> dataList = [];
  print('Data list kosong: $dataList');

  // Mengambil jumlah data dari pengguna
  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah list: ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('Masukkan angka lebih dari 0!');
      }
    } catch (e) {
      print('Input tidak valid! Masukkan angka yang benar.');
    }
  }

  // memasukkan data ke dalam list menggunakan for loop
  for (int i = 0; i < count; i++) {
    stdout.write('data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  // Menampilkan data list
  print('Data list:');
  print(dataList);

  // Tampil berdasarkan index tertentu
  stdout.write('Masukkan index yang ingin ditampilkan: ');
  int indexTampil = int.parse(stdin.readLineSync()!);
  print('Data index $indexTampil: ${dataList[indexTampil]}');

  // Ubah berdasarkan index tertentu
  stdout.write('Masukkan index yang ingin diubah: ');
  int indexUbah = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan data baru: ');
  String dataBaru = stdin.readLineSync()!;
  dataList[indexUbah] = dataBaru;
  print('Data setelah diubah: $dataList');

  // Hapus berdasarkan index tertentu
  stdout.write('Masukkan index yang ingin dihapus: ');
  int indexHapus = int.parse(stdin.readLineSync()!);
  dataList.removeAt(indexHapus);
  print('Data setelah dihapus: $dataList');

  // Tampilkan hasil akhir
  print('\n=== SEMUA DATA ===');
  for (int i = 0; i < dataList.length; i++) {
    print('Index $i: ${dataList[i]}');
  }
}
