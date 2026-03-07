import 'dart:io';

// ===== MIXIN =====
mixin Mengajar {
  String? mataKuliah;
  
  void tampilkanMengajar() {
    print("Mata Kuliah: ${mataKuliah ?? 'Belum diisi'}");
  }
}

mixin Penelitian {
  String? judulPenelitian;
  
  void tampilkanPenelitian() {
    print("Judul Penelitian: ${judulPenelitian ?? 'Belum diisi'}");
  }
}

mixin Organisasi {
  String? namaOrganisasi;
  
  void tampilkanOrganisasi() {
    print("Organisasi: ${namaOrganisasi ?? 'Belum diisi'}");
  }
}

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

// ===== DOSEN extends Mahasiswa with Mixin =====
class Dosen extends Mahasiswa with Mengajar, Penelitian {
  String? nip;

  void tampilkanDataDosen() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIP: ${nip ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
    tampilkanMengajar();
    tampilkanPenelitian();
  }
}

// ===== FAKULTAS extends Mahasiswa with Mixin =====
class Fakultas extends Mahasiswa with Organisasi, Penelitian {
  String? namaFakultas;

  void tampilkanDataFakultas() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("Nama Fakultas: ${namaFakultas ?? 'Belum diisi'}");
    tampilkanOrganisasi();
    tampilkanPenelitian();
  }
}

void main() {
  // Dosen
  print("=== DATA DOSEN ===");
  Dosen dosen = Dosen();
  stdout.write("Masukkan Nama Dosen: ");
  dosen.nama = stdin.readLineSync();
  stdout.write("Masukkan NIP: ");
  dosen.nip = stdin.readLineSync();
  stdout.write("Masukkan Jurusan: ");
  dosen.jurusan = stdin.readLineSync();
  stdout.write("Masukkan Mata Kuliah: ");
  dosen.mataKuliah = stdin.readLineSync();
  stdout.write("Masukkan Judul Penelitian: ");
  dosen.judulPenelitian = stdin.readLineSync();
  print("\nHasil:");
  dosen.tampilkanDataDosen();

  // Fakultas
  print("\n=== DATA FAKULTAS ===");
  Fakultas fakultas = Fakultas();
  stdout.write("Masukkan Nama: ");
  fakultas.nama = stdin.readLineSync();
  stdout.write("Masukkan Nama Fakultas: ");
  fakultas.namaFakultas = stdin.readLineSync();
  stdout.write("Masukkan Nama Organisasi: ");
  fakultas.namaOrganisasi = stdin.readLineSync();
  stdout.write("Masukkan Judul Penelitian: ");
  fakultas.judulPenelitian = stdin.readLineSync();
  print("\nHasil:");
  fakultas.tampilkanDataFakultas();
}
