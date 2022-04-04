import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/examroom_controller.dart';
import 'package:mm_school/utils/dimension.dart';

class ZclassInfo extends StatefulWidget {
  static const routeName = '/zclassInfo';
  const ZclassInfo({Key? key}) : super(key: key);

  @override
  State<ZclassInfo> createState() => _ZclassInfoState();
}

class _ZclassInfoState extends State<ZclassInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text('Exam Information',
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
        body: GetBuilder<ExamRoomController>(
          builder: (controller) {
            return Container(
              padding: EdgeInsets.all(Dimension.height20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  (AppBar().preferredSize.height + Dimension.height10),
              child: Center(
                  child: controller.isLoaded
                      ? SizedBox(
                          width: Dimension.height35,
                          height: Dimension.height35,
                          child: const CircularProgressIndicator())
                      : controller.examModel.examStudent.isNotEmpty
                          ?
                          //Correct
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //image
                                Container(
                                  width:
                                      Dimension.height100 + Dimension.height20,
                                  height:
                                      Dimension.height100 + Dimension.height20,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/congratulation.png'))),
                                ),
                                SizedBox(
                                  height: Dimension.height35,
                                ),
                                //Student Info
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //Student Information
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        const Text(
                                          'Student Information',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Dimension.height20,
                                    ),
                                    //Student Name
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Text(
                                          ' -  ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          controller
                                              .examModel.examStudent[0].name
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Dimension.height10,
                                    ),
                                    //Student Section
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Section',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Text(
                                          ' -  ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          controller
                                              .examModel.examStudent[0].section
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Dimension.height10,
                                    ),
                                    //Student Grade
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Grade',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Text(
                                          ' -  ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          controller
                                              .examModel.examStudent[0].grade
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Dimension.height10,
                                    ),
                                    //Exam Code
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 90,
                                          child: Text(
                                            'Exam Code',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Text(
                                          ' -  ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          controller
                                              .examModel.examStudent[0].examcode
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimension.height35,
                                ),
                                const Text("Congratulations!",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        height: 1.5)),
                                const Text(
                                    "You are eligible to answer the final exam of Academic Year 2021-2022.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        height: 1.5)),

                                SizedBox(
                                  height: Dimension.height35,
                                ),
                                //Done Btn
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimension.height5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.4),
                                          offset: const Offset(0, 7),
                                          blurRadius: 4,
                                        ),
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.4),
                                          offset: const Offset(0, 2),
                                          blurRadius: 3,
                                        ),
                                      ],
                                      border: Border.all(
                                          color: Colors.blue, width: 1.5),
                                      color: Colors.blue),
                                  child: MaterialButton(
                                      child: const Text(
                                        'Done',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      }),
                                ),
                              ],
                            )
                          :
                          //Fail
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width:
                                      Dimension.height100 + Dimension.height20,
                                  height:
                                      Dimension.height100 + Dimension.height20,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/error.png'))),
                                ),
                                SizedBox(
                                  height: Dimension.height20,
                                ),

                                const Text('Opps! Something went wrong.',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),

                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                const Text(
                                    "It look like, you are not eligible to answer the final exam of Academic Year 2021-2022 OR you need to enter correct information.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        height: 1.5)),
                                SizedBox(
                                  height: Dimension.height35,
                                ),
                                //Fail Btn
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimension.height5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.4),
                                          offset: const Offset(0, 7),
                                          blurRadius: 4,
                                        ),
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.4),
                                          offset: const Offset(0, 2),
                                          blurRadius: 3,
                                        ),
                                      ],
                                      border: Border.all(
                                          color: Colors.blue, width: 1.5),
                                      color: Colors.blue),
                                  child: MaterialButton(
                                      child: const Text(
                                        'Try Again',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      }),
                                ),
                              ],
                            )),
            );
          },
        ));
  }
}
