import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:testappgulyaev/data/dtos/characters_dto.dart';
import 'package:testappgulyaev/data/mappers/characters_mapper.dart';
import 'package:testappgulyaev/data/repositories/api_interface.dart';
import 'package:testappgulyaev/domain/models/card.dart';

class PotterRepository extends ApiInterface {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));
  static const String _baseUrl = 'https://api.potterdb.com';

  @override
  Future<List<CardData>?> loadData({String? q}) async {
    try {
      const String url = '$_baseUrl/v1/characters';
      final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
        url,
        queryParameters: q != null ? {'filter[name_cont]': q} : null,
      );
      final CharactersDto dto = CharactersDto.fromJson(response.data as Map<String, dynamic>);
      final List<CardData>? data = dto.data?.map((e) => e.toDomain()).toList();
      return data;
    } on DioException catch (e) {
      return null;
    }
  }
}
