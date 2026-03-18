import 'package:dio/dio.dart';
import '../models/dosen_model.dart';

class DosenRepository {
  final Dio _dio = Dio();

  Future<List<DosenModel>> getDosenList() async {
    try {
      // Menambahkan Options dengan header agar tidak terkena blokir (403)
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
        options: Options(
          headers: {'Accept': 'application/json', 'User-Agent': 'Flutter-App'},
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Menangkap error spesifik Dio untuk memudahkan debug
      if (e.response?.statusCode == 403) {
        throw Exception(
          'Akses ditolak (403). Coba cek koneksi atau gunakan VPN.',
        );
      }
      throw Exception('Terjadi kesalahan jaringan: ${e.message}');
    }
  }
}
