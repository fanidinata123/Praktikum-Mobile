import 'package:trying_flutter/features/mahasiswa/data/models/mahasiswa_model.dart';

/// Repository untuk mengambil data mahasiswa (dummy data)
class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaModel(
        nama: 'Budi Santoso',
        nim: '2021001',
        email: 'budi.santoso@student.ac.id',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        status: 'aktif',
      ),
      MahasiswaModel(
        nama: 'Siti Rahayu',
        nim: '2021002',
        email: 'siti.rahayu@student.ac.id',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        status: 'aktif',
      ),
      MahasiswaModel(
        nama: 'Andi Wijaya',
        nim: '2022001',
        email: 'andi.wijaya@student.ac.id',
        jurusan: 'Teknik Informatika',
        angkatan: '2022',
        status: 'aktif',
      ),
      MahasiswaModel(
        nama: 'Dewi Kusuma',
        nim: '2022002',
        email: 'dewi.kusuma@student.ac.id',
        jurusan: 'Teknik Informatika',
        angkatan: '2022',
        status: 'aktif',
      ),
      MahasiswaModel(
        nama: 'Rizky Pratama',
        nim: '2023001',
        email: 'rizky.pratama@student.ac.id',
        jurusan: 'Teknik Informatika',
        angkatan: '2023',
        status: 'aktif',
      ),
      MahasiswaModel(
        nama: 'Nur Halimah',
        nim: '2023002',
        email: 'nur.halimah@student.ac.id',
        jurusan: 'Teknik Informatika',
        angkatan: '2023',
        status: 'aktif',
      ),
      MahasiswaModel(
        nama: 'Fajar Nugroho',
        nim: '2020001',
        email: 'fajar.nugroho@student.ac.id',
        jurusan: 'Teknik Informatika',
        angkatan: '2020',
        status: 'lulus',
      ),
      MahasiswaModel(
        nama: 'Maya Sari',
        nim: '2020002',
        email: 'maya.sari@student.ac.id',
        jurusan: 'Teknik Informatika',
        angkatan: '2020',
        status: 'lulus',
      ),
    ];
  }
}