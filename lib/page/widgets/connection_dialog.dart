import 'package:flutter/material.dart';
import 'package:mm_school/utils/dimension.dart';

class ConnectionDialog extends StatelessWidget {
  const ConnectionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: Dimension.height10, right: Dimension.height10),
      height: Dimension.height200 + Dimension.height35,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.height20),
          border: Border.all(
              color: Colors.red, width: 2.5, style: BorderStyle.solid)),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: Dimension.height50,
              height: Dimension.height50,
              child: Image.asset('assets/img/no-wifi.png')),
          SizedBox(
            height: Dimension.height20,
          ),
          const Text('No internet connection!',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          SizedBox(
            height: Dimension.height10,
          ),
          const Text('Please check your internet connection.',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 16,
                  color: Colors.grey)),
          SizedBox(
            height: Dimension.height10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: Dimension.height35 + Dimension.height5,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimension.height20, vertical: Dimension.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      (Dimension.height35 + Dimension.height5) / 2),
                  color: Colors.red),
              child: const Text(
                "Try again",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed',
                    color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
