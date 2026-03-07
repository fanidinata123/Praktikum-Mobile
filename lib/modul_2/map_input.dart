import 'dart:io';

void main() {
  Map<String, String> dataMahasiswa = {};

  // ===== INPUT SINGLE =====
  print('=== INPUT DATA MAHASISWA ===');
  stdout.write('Masukkan NIM: ');
  String nim = stdin.readLineSync()!;
  stdout.write('Masukkan Nama: ');
  String nama = stdin.readLineSync()!;
  stdout.write('Masukkan Jurusan: ');
  String jurusan = stdin.readLineSync()!;
  stdout.write('Masukkan IPK: ');
  String ipk = stdin.readLineSync()!;

  dataMahasiswa = {
    'nim': nim,
    'nama': nama,
    'jurusan': jurusan,
    'ipk': ipk,
  };
  print('Data Mahasiswa: $dataMahasiswa');

  // ===== INPUT MULTIPLE =====
  print('\n=== INPUT MULTIPLE MAHASISWA ===');
  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  List<Map<String, String>> listMahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print('\n---- Mahasiswa ke-${i + 1} ----');
    stdout.write('Masukkan NIM: ');
    String nimM = stdin.readLineSync()!;
    stdout.write('Masukkan Nama: ');
    String namaM = stdin.readLineSync()!;
    stdout.write('Masukkan Jurusan: ');
    String jurusanM = stdin.readLineSync()!;
    stdout.write('Masukkan IPK: ');
    String ipkM = stdin.readLineSync()!;

    listMahasiswa.add({
      'nim': nimM,
      'nama': namaM,
      'jurusan': jurusanM,
      'ipk': ipkM,
    });
  }

  print('\n=== SEMUA DATA MAHASISWA ===');
  for (int i = 0; i < listMahasiswa.length; i++) {
    print('Mahasiswa ke-${i + 1}: ${listMahasiswa[i]}');
  }
}
