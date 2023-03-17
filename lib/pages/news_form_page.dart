import 'dart:io';

import 'package:codigo6_alertas/utils/types.dart';
import 'package:codigo6_alertas/widgets/common_button_widget.dart';
import 'package:codigo6_alertas/widgets/common_textfield_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class NewsFormPage extends StatefulWidget {
  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  TextEditingController _titulocontroller = TextEditingController();

  TextEditingController _linkcontroller = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  XFile? image;

  Future<void> getImageGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image!.path);
    }
    setState(() {});
  }

  Future<void> getImageCamera() async {
    image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print(image!.path);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Registra Noticias",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CommonTextFieldWidget(
                      label: "Titulo",
                      hintText: "Ingrese un título",
                      type: InputType.text,
                      controller: _titulocontroller,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CommonTextFieldWidget(
                      label: "Link",
                      hintText: "Ingresa un Link",
                      type: InputType.text,
                      controller: _linkcontroller,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              getImageGallery();
                            },
                            label: Text("Galeria"),
                            icon: Icon(Icons.image),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              getImageCamera();
                            },
                            label: Text("Cámara"),
                            icon: Icon(Icons.camera),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // image != null
                    //     ? ClipRRect(
                    //         borderRadius: BorderRadius.circular(14.0),
                    //         child: Image.file(
                    //           File(image!.path),
                    //           height: 220,
                    //         ),
                    //       )
                    //     : Image.asset("assets/images/placeholder.webp"),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                        //color: Colors.amber,
                        borderRadius: BorderRadius.circular(14.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: image != null
                              ? FileImage(File(image!.path))
                              : AssetImage("assets/images/placeholder.webp")
                                  as ImageProvider,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CommonButtonWidget(
                text: "Registrar",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
