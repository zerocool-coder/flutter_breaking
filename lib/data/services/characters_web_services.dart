import 'package:dio/dio.dart';
import 'package:flutter_breaking/constants/strings.dart';

class CharacterWebService {
  late Dio dio;

  CharacterWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000, // 60 seconds
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getCharQuote(String charName) async {
    try {
      Response response =
          await dio.get('quote', queryParameters: {'author': charName});
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
