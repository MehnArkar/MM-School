import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/utils/dimension.dart';

class Lesson extends StatelessWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EclassController>(builder: (controller) {
      return SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: controller.isLoaded
              ? controller.lessonModel.eclassData.length > 0
                  ? Column(children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            controller.lessonModel.eclassData.length, (index) {
                          return GestureDetector(
                            onTap: () async {},
                            child: Container(
                              padding: EdgeInsets.all(Dimension.height10),
                              margin: EdgeInsets.only(
                                  top: Dimension.height10,
                                  left: Dimension.height20,
                                  right: Dimension.height20),
                              width: double.maxFinite,
                              height: Dimension.height100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.lightBlue, width: 1),
                                borderRadius:
                                    BorderRadius.circular(Dimension.height15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    offset: const Offset(0, 7),
                                    blurRadius: 4,
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    offset: const Offset(0, 2),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: Dimension.height100,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                              width: Dimension.height50,
                                              height: Dimension.height50,
                                              child: Image.asset(
                                                  'assets/img/lesson.png',
                                                  fit: BoxFit.cover)),
                                          SizedBox(
                                            height: Dimension.height10,
                                          ),
                                          Text(
                                            controller.lessonModel
                                                .eclassData[index].subject
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimension.height5,
                                    ),
                                    const VerticalDivider(
                                      thickness: 2,
                                      color: Colors.lightBlue,
                                    ),
                                    SizedBox(
                                      width: Dimension.height5,
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          controller.lessonModel
                                              .eclassData[index].description
                                              .toString(),
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'RobotoCondensed',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ])
                  : Center(
                      child: Text(
                        'No Lesson yet!',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
              : Center(
                  child: Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator()),
                ),
        ),
      );
    });
  }
}
