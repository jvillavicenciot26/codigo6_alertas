import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:codigo6_alertas/models/incident_model.dart';
import 'package:codigo6_alertas/models/user_model.dart';
import 'package:codigo6_alertas/utils/sp_global.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel> login(String dni, String password) async {
    try {
      Uri url = Uri.parse("http://167.99.240.65/API/login/");
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {"username": dni, "password": password},
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        UserModel userModel = UserModel.fromJson(data["user"]);
        SPGlobal().isLogin = true;
        SPGlobal().token = data["access"];
        return userModel;
      } else if (response.statusCode == 400) {
        throw {"message": "Tus credenciales fueron incorrectas."};
      } else {
        throw {"message": "Hubo un error."};
      }
    } on TimeoutException catch (e) {
      return Future.error({
        "message":
            "Hubo un inconveniente con el servidor, por favor inténtalo luego."
      });
    } on SocketException catch (e) {
      return Future.error({
        "message":
            "Hubo un inconveniente con el internet, por favor inténtalo luego."
      });
    } on Error catch (e) {
      return Future.error(
          {"message": "Hubo un inconveniente por favor inténtalo luego."});
    }
  }

  register() {}

  //

  Future<List<IncidentModel>> getIncidents() async {
    Uri url = Uri.parse("http://167.99.240.65/API/incidentes/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String dataConvert = Utf8Decoder().convert(response
          .bodyBytes); //Para procesar los caracteres extraños como tildes y demas
      List data = json.decode(dataConvert);
      List<IncidentModel> incidents = [];
      incidents = data.map((e) => IncidentModel.fromJson(e)).toList();
      return incidents;
    }
    return [];
  }
}
