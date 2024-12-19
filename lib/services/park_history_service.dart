
import 'package:dio/dio.dart';

class ParkHistoryService {

  Future<ParkHistory> getUserById(int id) async {
    try {
      Response response = await Dio().get('realbetis.aoisdja');
      
      return User.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}