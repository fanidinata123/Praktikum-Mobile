import 'dart:convert';
import 'package:trying_flutter/features/dosen/data/models/dosen_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class DosenRepository {
  // ─── STEP 4: Mendapatkan daftar dosen menggunakan HTTP ──────────────────────
  Future<List<DosenModel>> getDosenList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug: Tampilkan data yang sudah di-decode
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Gagal memuat data dosen: ${response.statusCode}');
    }
  }

  // ─── STEP 7: Mendapatkan daftar dosen menggunakan DIO ───────────────────────
  Future<List<DosenModel>> getDosenListDio() async {
    final dio = Dio();
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data dosen (dio): ${response.statusCode}');
    }
  }
}