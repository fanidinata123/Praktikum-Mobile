/// Model data dosen
class DosenModel {
  final String nama;
  final String nip;
  final String email;
  final String jurusan;

  DosenModel({
    required this.nama,
    required this.nip,
    required this.email,
    required this.jurusan,
  });

  /// Parsing dari JSON (misalnya dari API)
  factory DosenModel.fromJson(Map<String, dynamic> json) {
    return DosenModel(
      nama: json['nama'] ?? '',
      nip: json['nip'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
    );
  }

  /// Konversi ke JSON (untuk kirim ke API)
  Map<String, dynamic> toJson() {
    return {'nama': nama, 'nip': nip, 'email': email, 'jurusan': jurusan};
  }
}