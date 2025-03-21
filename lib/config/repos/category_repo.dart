import 'package:test_app/app_services/api_service.dart';
import 'package:test_app/config/data/api_routes.dart';

class All_category_Repo {
  static Future<List<dynamic>> get_all_categories() async {
    try {
      return await ApiService().get(
        ApiRoutes.cateogry_api,
        headers: {'Content-Type': 'application/json'},
      ).then((val) {
        return val;
      }).catchError((er) {
        throw er;
      });
    } catch (e) {
      rethrow;
    }
  }
}
