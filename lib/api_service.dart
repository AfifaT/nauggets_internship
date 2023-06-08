import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async{
    String urlString = "https://reqres.in/api/login";
    Uri url = Uri.parse(urlString);


    final response = await http.post(url, body: requestModel.toJson());
    if(response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}