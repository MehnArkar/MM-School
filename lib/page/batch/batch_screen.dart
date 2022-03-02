import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/model/eclass_model.dart';
import 'package:mm_school/page/eclass_grade/eclass_grade.dart';
import 'package:mm_school/utils/dimension.dart';

class BatchScreen extends StatefulWidget {
  static const routeName = '/batchScreen';
  const BatchScreen({Key? key}) : super(key: key);

  @override
  State<BatchScreen> createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  EclassController eclassController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('E-Classes',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Container(
              margin: EdgeInsets.only(right: Dimension.height10),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/img/circle.png',
                fit: BoxFit.fill,
              ))
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: GetBuilder<DataController>(builder: (controller) {
          return GridView.count(
            childAspectRatio: 1,
            primary: false,
            crossAxisSpacing: Dimension.height20,
            mainAxisSpacing: Dimension.height20,
            padding: EdgeInsets.only(
              left: Dimension.height20,
              right: Dimension.height20,
              bottom: Dimension.height20,
              top: Dimension.height20,
            ),
            crossAxisCount: 2,
            children:
                List.generate(controller.datamodel.batch!.length, (index) {
              return GestureDetector(
                onTap: () {
                  eclassController.setBatch(
                      'b' + controller.datamodel.batch![index].toString());
                  Get.toNamed(EclassGrade.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        offset: const Offset(0, 5),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        offset: const Offset(0, 1),
                        blurRadius: 3,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimension.height15),
                  ),
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Dimension.height50,
                            height: Dimension.height50,
                            child: Image.asset('assets/img/batch.png',
                                fit: BoxFit.cover),
                          ),
                          SizedBox(
                            height: Dimension.height10,
                          ),
                          Text(
                            "Batch - " +
                                controller.datamodel.batch![index].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'RobotoCondensed',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(Dimension.height10),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(25)),
        child: const Text(
          'Registration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}