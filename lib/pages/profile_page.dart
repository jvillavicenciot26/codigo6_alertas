import 'package:codigo6_alertas/pages/login_page.dart';
import 'package:codigo6_alertas/utils/sp_global.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Cerrar Sesión"),
          onPressed: () {
            SPGlobal().isLogin = false;
            SPGlobal().token = "";
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
          },
        ),
      ),
    );
  }
}
