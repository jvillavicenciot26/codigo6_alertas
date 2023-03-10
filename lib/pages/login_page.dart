import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/utils/types.dart';
import 'package:codigo6_alertas/widgets/common_button_widget.dart';
import 'package:codigo6_alertas/widgets/common_textfield_password_widget.dart';
import 'package:codigo6_alertas/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Image.network(
                  "https://www.municayma.gob.pe/wp-content/uploads/2021/07/escudo-solo.png",
                  height: 90,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Municipalidad Distrital de Cayma",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff212121),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Alerta Cayma",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121),
                  ),
                ),
                CommonTextFieldWidget(
                  label: "DNI",
                  hintText: "Tu DNI",
                  type: InputType.dni,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CommonTextFieldPasswordWidget(),
                SizedBox(
                  height: 20.0,
                ),
                CommonButtonWidget(
                  text: "Iniciar Sesion",
                  onPressed: () {
                    ApiService apiService = ApiService();
                    apiService.login();
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Aun no estas registrado? ",
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Registrate",
                        style: TextStyle(
                          color: Color(0xff605AF8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
