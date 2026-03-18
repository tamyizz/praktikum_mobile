import 'package:dio/dio.dart';
import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  final Dio _dio = Dio();

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/comments',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'User-Agent': 'PostmanRuntime/7.29.2',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => MahasiswaModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa');
      }
    } catch (e) {
      throw Exception('Kesalahan: $e');
    }
  }
}
