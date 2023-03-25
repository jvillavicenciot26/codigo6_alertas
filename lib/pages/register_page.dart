import 'package:codigo6_alertas/models/user_model.dart';
import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/utils/types.dart';
import 'package:codigo6_alertas/widgets/common_button_widget.dart';
import 'package:codigo6_alertas/widgets/common_textfield_password_widget.dart';
import 'package:codigo6_alertas/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  createAccount() {
    if (formKey.currentState!.validate()) {
      ApiService apiService = ApiService();
      UserModel user = UserModel(
        nombre: "",
        apellido: "",
        id: 0,
        nombreCompleto: _nombreController.text,
        dni: _dniController.text,
        telefono: _telefonoController.text,
        direccion: _direccionController.text,
      );
      print(user.dni);
      print(_passwordController.text);
      apiService.registerAccount(user, _passwordController.text).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xff06d6a0),
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            //margin: EdgeInsets.all(12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            content: Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    "Registro exitoso.",
                  ),
                )
              ],
            ),
          ),
        );
        Navigator.pop(context);
      }).catchError((error) {
        print(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vamos a crear tu cuenta",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff212121),
                    ),
                  ),
                  Text(
                    "Registrarse en Alerta Cayma es rápido y gratuito",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff212121),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CommonTextFieldWidget(
                    label: "DNI",
                    hintText: "Tu DNI",
                    type: InputType.dni,
                    controller: _dniController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CommonTextFieldWidget(
                    label: "Nombre Completo",
                    hintText: "Tu Nombre",
                    type: InputType.text,
                    controller: _nombreController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CommonTextFieldWidget(
                    label: "Telefono",
                    hintText: "Tu Telefono",
                    type: InputType.phone,
                    controller: _telefonoController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CommonTextFieldWidget(
                    label: "Direccion",
                    hintText: "Tu Direccion",
                    type: InputType.text,
                    controller: _direccionController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CommonTextFieldPasswordWidget(
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CommonButtonWidget(
                    text: "Registrate",
                    onPressed: () {
                      createAccount();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
