import 'dart:io';

// ===== BAGIAN A: CLASS =====
class Mahasiswa {
  String nama = "Anang";

  void tampilkanData() {
    print(nama);
  }
}

// ===== BAGIAN B: OBJECT =====
class MahasiswaObject {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

void main() {
  // Bagian A
  print("=== BAGIAN A: CLASS ===");
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

  // Bagian B
  print("\n=== BAGIAN B: OBJECT ===");
  MahasiswaObject mahasiswa = MahasiswaObject();
  stdout.write("Masukkan Nama Mahasiswa: ");
  mahasiswa.nama = stdin.readLineSync();
  stdout.write("Masukkan NIM Mahasiswa: ");
  mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '');
  stdout.write("Masukkan Jurusan Mahasiswa: ");
  mahasiswa.jurusan = stdin.readLineSync();
  
  print("\nHasil:");
  mahasiswa.tampilkanData();
}
