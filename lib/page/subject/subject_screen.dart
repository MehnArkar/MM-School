import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:mm_school/utils/globleOnClick.dart';

class SubjectScreen extends StatefulWidget {
  static const routeName = '/subjectScreen';
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  DialogController dialogController = Get.find();
  AdController adController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Sub> subList = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Subjects',
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
        child: GridView.count(
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
          children: List.generate(subList.length, (index) {
            return Container(
              height: ((MediaQuery.of(context).size.width -
                      (Dimension.height35 + Dimension.height5)) /
                  2),
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: ((MediaQuery.of(context).size.width -
                                    (Dimension.height60)) /
                                2) -
                            (Dimension.height35 / 2),
                        padding:
                            EdgeInsets.only(bottom: Dimension.height35 / 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.height15),
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
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/img/books.png',
                                width: Dimension.height50,
                                height: Dimension.height50,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: Dimension.height5,
                              ),
                              Text(
                                subList[index].subName.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          GlobleOnClick().onCliclUrl(AppConstant.FOURTH_AD_UNIT,
                              subList[index].link, context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.height35 / 2),
                            border:
                                Border.all(width: 1.5, color: Colors.lightBlue),
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
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Center(
                            child: Text(
                              'Learn',
                              style: TextStyle(
                                  color: Colors.blue[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
