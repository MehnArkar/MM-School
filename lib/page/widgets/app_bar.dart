import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: 60,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MM School',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.redAccent,
                fontSize: 26,
              ),
            ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300]),
              child: Center(
                child: Text(
                  'M',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
