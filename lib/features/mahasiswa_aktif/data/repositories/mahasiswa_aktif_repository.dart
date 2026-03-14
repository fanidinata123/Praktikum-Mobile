import 'dart:convert';
import 'package:trying_flutter/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class MahasiswaAktifRepository {
  // ─── Menggunakan HTTP ────────────────────────────────────────────────────────
  Future<List<MahasiswaAktifModel>> getDataHttp() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug: Tampilkan data yang sudah di-decode
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Gagal memuat data: ${response.statusCode}');
    }
  }

  // ─── Menggunakan DIO ─────────────────────────────────────────────────────────
  Future<List<MahasiswaAktifModel>> getDataDio() async {
    final dio = Dio();
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data (dio): ${response.statusCode}');
    }
  }

  // Default: pakai http
  Future<List<MahasiswaAktifModel>> getData() async => getDataHttp();
}