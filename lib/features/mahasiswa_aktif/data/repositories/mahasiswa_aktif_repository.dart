import 'package:dio/dio.dart';
import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final Dio _dio = Dio();

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'User-Agent':
                'PostmanRuntime/7.29.2',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa aktif');
      }
    } catch (e) {
      throw Exception('Kesalahan: $e');
    }
  }
}
