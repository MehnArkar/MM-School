import 'package:flutter/material.dart';
import 'package:mm_school/utils/dimension.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  IconData icon;
  String hintText;
  bool isPass;
  AppTextField(
      {Key? key,
      required this.textController,
      required this.icon,
      required this.hintText,
      required this.isPass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.height10 * 5.5,
      margin:
          EdgeInsets.only(left: Dimension.height20, right: Dimension.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.height10 * 7 / 2),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 8),
                blurRadius: 8,
                spreadRadius: 6,
                color: Colors.grey.withOpacity(0.2)),
          ]),
      child: TextField(
        controller: textController,
        obscureText: isPass ? true : false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.blue[400],
          ),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.height35),
              borderSide: const BorderSide(
                width: 1.0,
                color: Colors.white,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.height35),
              borderSide: const BorderSide(
                width: 1.0,
                color: Colors.white,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.height35),
              borderSide: const BorderSide(
                width: 1.0,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
