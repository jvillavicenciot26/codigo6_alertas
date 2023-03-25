import 'package:codigo6_alertas/models/person_model.dart';
import 'package:codigo6_alertas/pages/login_page.dart';
import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/ui/general.dart';
import 'package:codigo6_alertas/utils/sp_global.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ApiService apiService = ApiService();
  PersonModel? person;

  getData() async {
    person = await apiService.getPerson();
    print(person);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    return person != null
        ? Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: cHeight * 0.4,
                    color: kBrandPrimaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: Icon(
                            Icons.person,
                            color: kBrandPrimaryColor,
                            size: 60.0,
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          person!.nombreCompleto,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Datos Personales",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone,
                            ),
                            title: Text(
                              person!.telefono,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.home,
                            ),
                            title: Text(
                              person!.direccion,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person_pin,
                            ),
                            title: Text(
                              person!.dni,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: kBrandPrimaryColor,
                                  width: 2.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              child: Text(
                                "CERRAR SESIÓN",
                                style: TextStyle(
                                  color: kBrandPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                SPGlobal().isLogin = false;
                                SPGlobal().token = "";
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                    (route) => false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
