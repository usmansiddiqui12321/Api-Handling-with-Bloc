import 'package:api_handling_bloc/Data/Models/Repositories/Api/api.dart';
import 'package:api_handling_bloc/Data/Models/post_model.dart';
import 'package:dio/dio.dart';

class PostRepository {
  API api = API();
  Future<List<PostModel>> fetchPost() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
