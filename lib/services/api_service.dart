import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:codigo6_alertas/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel> login() async {
    Uri url = Uri.parse("http://167.99.240.65/API/login/");
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {
          "username": "45120747",
          "password": "Nisira2926",
        },
      ),
    );
    if (response.statusCode == 200) {}
    //print(response.statusCode);
    //try catch
    // try {
    //   String message = "Hola";
    //   print(message[10]);
    // } catch (e) {
    //   print("error ::: $e");
    // }

    // try {
    //   String message = "Hola";
    //   print(message[10]);
    // } on RangeError catch (e) {
    //   print("error Range");
    // } on TimeoutException catch (e) {
    //   //En caso lentitud de servicio
    // } on SocketException catch (e) {
    //   //En caso no halla internet
    // } on Error catch (e) {
    //   //Errores en general
    //   print("error generic");
    // }
  }
}
