/// Model data mahasiswa
class MahasiswaModel {
  final String nama;
  final String nim;
  final String email;
  final String jurusan;
  final String angkatan;
  final String status; // aktif / lulus / cuti

  MahasiswaModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.angkatan,
    this.status = 'aktif',
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
      angkatan: json['angkatan'] ?? '',
      status: json['status'] ?? 'aktif',
    );
  }

  Map<String, dynamic> toJson() => {
    'nama': nama,
    'nim': nim,
    'email': email,
    'jurusan': jurusan,
    'angkatan': angkatan,
    'status': status,
  };
}