import 'dart:io';

// ===== CLASS DASAR =====
class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

// ===== EXTENDS: MahasiswaAktif =====
class MahasiswaAktif extends Mahasiswa {
  String? semester;
  String? statusBeasiswa;

  void tampilkanDataAktif() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
    print("Semester: ${semester ?? 'Belum diisi'}");
    print("Status Beasiswa: ${statusBeasiswa ?? 'Tidak ada'}");
  }
}

// ===== EXTENDS: MahasiswaAlumni =====
class MahasiswaAlumni extends Mahasiswa {
  int? tahunLulus;
  String? pekerjaan;

  void tampilkanDataAlumni() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
    print("Tahun Lulus: ${tahunLulus ?? 'Belum diisi'}");
    print("Pekerjaan: ${pekerjaan ?? 'Belum diisi'}");
  }
}

void main() {
  // MahasiswaAktif
  print("=== MAHASISWA AKTIF ===");
  MahasiswaAktif aktif = MahasiswaAktif();
  stdout.write("Masukkan Nama: ");
  aktif.nama = stdin.readLineSync();
  stdout.write("Masukkan NIM: ");
  aktif.nim = int.tryParse(stdin.readLineSync() ?? '');
  stdout.write("Masukkan Jurusan: ");
  aktif.jurusan = stdin.readLineSync();
  stdout.write("Masukkan Semester: ");
  aktif.semester = stdin.readLineSync();
  stdout.write("Masukkan Status Beasiswa: ");
  aktif.statusBeasiswa = stdin.readLineSync();
  print("\nHasil:");
  aktif.tampilkanDataAktif();

  // MahasiswaAlumni
  print("\n=== MAHASISWA ALUMNI ===");
  MahasiswaAlumni alumni = MahasiswaAlumni();
  stdout.write("Masukkan Nama: ");
  alumni.nama = stdin.readLineSync();
  stdout.write("Masukkan NIM: ");
  alumni.nim = int.tryParse(stdin.readLineSync() ?? '');
  stdout.write("Masukkan Jurusan: ");
  alumni.jurusan = stdin.readLineSync();
  stdout.write("Masukkan Tahun Lulus: ");
  alumni.tahunLulus = int.tryParse(stdin.readLineSync() ?? '');
  stdout.write("Masukkan Pekerjaan: ");
  alumni.pekerjaan = stdin.readLineSync();
  print("\nHasil:");
  alumni.tampilkanDataAlumni();
}
