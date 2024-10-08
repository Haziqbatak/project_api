import 'dart:convert';
import 'package:project_api/model/photos.dart';
import 'package:project_api/model/users.dart';
import 'package:project_api/config/config.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Users>?> getUsers() async {
    var url = Uri.parse('${baseUrl}users');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((user) => Users.fromJson(user)).toList();
    } else {
      print('Request Gagal dengan status : ${response.statusCode}');
      return null;
    }
  }

  Future<List<Photos>?> getPhotos() async {
    var url = Uri.parse('${baseUrl}photos');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((photos) => Photos.fromJson(photos)).toList();
    } else {
      print('Request Gagal dengan status : ${response.statusCode}');
      return null;
    }
  }
}
