import 'package:flutter/material.dart';

class CommonTextFieldPasswordWidget extends StatefulWidget {
  const CommonTextFieldPasswordWidget({super.key});

  @override
  State<CommonTextFieldPasswordWidget> createState() =>
      _CommonTextFieldPasswordWidgetState();
}

class _CommonTextFieldPasswordWidgetState
    extends State<CommonTextFieldPasswordWidget> {
  bool isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contraseña",
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 12.0,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: TextField(
            obscureText: isInvisible,
            decoration: InputDecoration(
              hintText: "Tu Contraseña",
              hintStyle: TextStyle(
                fontSize: 14.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isInvisible
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  color: Color(0xff605AF8),
                ),
                onPressed: () {
                  isInvisible = !isInvisible;
                  setState(() {});
                },
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 14.0,
              ),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
