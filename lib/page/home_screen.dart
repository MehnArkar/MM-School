import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetBuilder<DataController>(builder: (dataController) {
          return Center(
              child: dataController.isLoaded
                  ? Text(dataController.datamodel.state![0].toString())
                  : CircularProgressIndicator(
                      color: Colors.redAccent,
                    ));
        }),
      ),
    );
  }
}
