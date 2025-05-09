import 'package:http/http.dart' as http;
import 'package:musicapp1/models/create_user.dart';

class UserService {
  var baseUrl = "http://localhost:3000/user";

  Future<bool> createUser(CreateUser user) async {
    var uri = Uri.http(baseUrl);
    var resp = await http.post(uri, body: user.toJson());
    return resp.statusCode == 201 ? true : false; // Indicate success
  }
}
