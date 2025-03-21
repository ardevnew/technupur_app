import 'package:test_app/exports.dart';

class ApiService {
  final dio = Dio();

  Future<List<dynamic>> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await dio.get(url,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        return (response.data);
      }
      print("response value");
      print((response.data));
      return response.data;
    } on SocketException catch (e) {
      print("network issue $e");
      return [];
    } on TimeoutException catch (e) {
      print('in timeout $e');
      return [];
    } on HttpException catch (e) {
      print("data invalid $e");
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
