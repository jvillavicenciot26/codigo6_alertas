import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:codigo6_alertas/models/incident_model.dart';
import 'package:codigo6_alertas/models/incident_type_model.dart';
import 'package:codigo6_alertas/models/new_user_model.dart';
import 'package:codigo6_alertas/models/news_model.dart';
import 'package:codigo6_alertas/models/person_model.dart';
import 'package:codigo6_alertas/models/user_model.dart';
import 'package:codigo6_alertas/utils/sp_global.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

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
        SPGlobal().id = userModel.id;
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

  Future<IncidentModel> registerIncident(int type, Position position) async {
    Uri url = Uri.parse("http://167.99.240.65/API/incidentes/crear/");
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token ${SPGlobal().token}",
      },
      body: json.encode(
        {
          "latitud": position.latitude,
          "longitud": position.longitude,
          "tipoIncidente": type,
          "estado": "Abierto"
        },
      ),
    );
    if (response.statusCode == 201) {
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
      IncidentModel incidentModel = IncidentModel.fromJson(data);
      return incidentModel;
    } else {
      //return null;
      throw {"message": "Hubo un inconveniente, inténtalo nuevamente."};
    }
  }

  Future<NewUserModel> registerAccount(UserModel user, String password) async {
    Uri url = Uri.parse("http://167.99.240.65/API/registro/");
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {
          "password": password,
          "nombreCompleto": user.nombreCompleto,
          "telefono": user.telefono,
          "direccion": user.direccion,
          "dni": user.dni
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
      NewUserModel newUser = NewUserModel.fromJson(data);
      return newUser;
    } else {
      //return null;
      throw {"message": "Hubo un inconveniente, inténtalo nuevamente."};
    }
  }

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

  Future<List<IncidentType>> getTypeIncidents() async {
    Uri url = Uri.parse("http://167.99.240.65/API/incidentes/tipos/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String dataConvert = Utf8Decoder().convert(response
          .bodyBytes); //Para procesar los caracteres extraños como tildes y demas
      List data = json.decode(dataConvert);
      List<IncidentType> incidentstype = [];
      incidentstype = data.map((e) => IncidentType.fromJson(e)).toList();
      return incidentstype;
    }
    return [];
  }

  Future<List> getNews() async {
    Uri url = Uri.parse("http://167.99.240.65/API/noticias/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      List data = json.decode(dataConvert);
      List<NewsModel> news = [];
      news = data.map((e) => NewsModel.fromJson(e)).toList();
      return news;
    }
    return [];
  }

  Future<NewsModel> registerNews(NewsModel model) async {
    Uri url = Uri.parse("http://167.99.240.65/API/noticias/");
    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      url,
    );
    //headers
    //request.headers.addAll({});
    request.fields["titulo"] = model.titulo;
    request.fields["link"] = model.link;
    request.fields["fecha"] = model.fecha.toString().substring(0, 10);
    List<String> dataMime = mime(model.imagen)!.split("/");
    http.MultipartFile file = await http.MultipartFile.fromPath(
      "imagen",
      model.imagen,
      contentType: MediaType(dataMime[0], dataMime[1]),
    );
    //print(mime("ruta de archivo"));
    request.files.add(file);
    //print(request.fields);
    http.StreamedResponse streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);
    //print(response.statusCode);
    if (response.statusCode == 201) {
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
      NewsModel news = NewsModel.fromJson(data);
      return news;
    } else {
      //return null;
      throw {"message": "Hubo un inconveniente, inténtalo nuevamente."};
    }
  }

  Future<PersonModel> getPerson() async {
    print(SPGlobal().id);
    Uri url =
        Uri.parse("http://167.99.240.65/API/ciudadanos/${SPGlobal().id}/");
    http.Response response = await http.get(url);
    //if (response.statusCode == 200) {
    String dataConvert = Utf8Decoder().convert(response.bodyBytes);
    Map<String, dynamic> data = json.decode(dataConvert);
    PersonModel person = PersonModel.fromJson(data);
    return person;
    //}
    //return [];
  }
}
