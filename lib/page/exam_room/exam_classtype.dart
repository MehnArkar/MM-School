import 'package:flutter/material.dart';
import 'package:mm_school/page/exam_room/exam_eclass.dart';
import 'package:mm_school/page/exam_room/exam_zclass.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:mm_school/utils/globleOnClick.dart';

class ExamClassType extends StatelessWidget {
  static const routeName = '/examClassType';
  const ExamClassType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Class Type',
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //E - classes
              Container(
                padding: EdgeInsets.all(Dimension.height20),
                margin: EdgeInsets.only(
                    top: Dimension.height10,
                    bottom: Dimension.height10,
                    left: Dimension.height20,
                    right: Dimension.height20),
                width: double.maxFinite,
                height: Dimension.height100 + Dimension.height25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.height15),
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
                    children: [
                      Container(
                          width: Dimension.height60,
                          height: Dimension.height60,
                          child: Image.asset('assets/img/Eclasses.png',
                              fit: BoxFit.cover)),
                      SizedBox(
                        width: Dimension.height20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'E - Classes',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(child: Container()),
                            //Select btn
                            GestureDetector(
                              onTap: () {
                                GlobleOnClick().onClick(
                                    AppConstant.SECOND_AD_UNIT,
                                    null,
                                    ExamEclass.routeName,
                                    null,
                                    context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimension.height35 / 2),
                                  border: Border.all(
                                      width: 1.5, color: Colors.lightBlue),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.3),
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
                                ),
                                height: Dimension.height35,
                                margin: EdgeInsets.only(
                                    left: Dimension.height10,
                                    right: Dimension.height10),
                                child: Center(
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                        color: Colors.blue[400],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Zoom - class
              Container(
                padding: EdgeInsets.all(Dimension.height20),
                margin: EdgeInsets.only(
                    top: Dimension.height20,
                    bottom: Dimension.height10,
                    left: Dimension.height20,
                    right: Dimension.height20),
                width: double.maxFinite,
                height: Dimension.height100 + Dimension.height25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.height15),
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
                    children: [
                      Container(
                          width: Dimension.height60,
                          height: Dimension.height60,
                          child: Image.asset('assets/img/Eclasses.png',
                              fit: BoxFit.cover)),
                      SizedBox(
                        width: Dimension.height20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Zoom - Classes',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(child: Container()),
                            //Select btn
                            GestureDetector(
                              onTap: () {
                                GlobleOnClick().onClick(
                                    AppConstant.SECOND_AD_UNIT,
                                    null,
                                    ExamZclass.routeName,
                                    null,
                                    context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimension.height35 / 2),
                                  border: Border.all(
                                      width: 1.5, color: Colors.lightBlue),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.3),
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
                                ),
                                height: Dimension.height35,
                                margin: EdgeInsets.only(
                                    left: Dimension.height10,
                                    right: Dimension.height10),
                                child: Center(
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                        color: Colors.blue[400],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
