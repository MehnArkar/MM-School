import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/model/data_model.dart';
import 'package:mm_school/page/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class SubjectScreen extends StatelessWidget {
  static const routeName = '/subjectScreen';
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusbar_height = MediaQuery.of(context).padding.top;
    List<Sub> subList = Get.arguments;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: EdgeInsets.only(top: statusbar_height),
        child: Column(
          children: [
            AppBarWidget(),
            Expanded(
                child: Container(
              child: ListView.builder(
                  itemCount: subList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (subList[index].link != "") {
                          await launch(subList[index].link.toString());
                        } else {
                          Get.snackbar('No data', 'No data for this subject',
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: double.maxFinite,
                        height: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.redAccent, width: 1.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Center(
                          child: Text(
                            subList[index].subName.toString(),
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    );
                  })),
            ))
          ],
        ),
      ),
    );
  }
}
