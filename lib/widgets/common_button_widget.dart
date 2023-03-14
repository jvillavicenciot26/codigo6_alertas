import 'package:codigo6_alertas/ui/general.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  String text;
  VoidCallback onPressed;

  CommonButtonWidget({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: kBrandPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        ),
      ),
    );
  }
}
