import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/page/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusbar_height = MediaQuery.of(context).padding.top;
    print(Get.context!.height);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: GetBuilder<DataController>(builder: (dataController) {
        return Container(
          margin: EdgeInsets.only(top: statusbar_height),
          child: Column(
            children: [
              //App Bar
              AppBarWidget(),
              dataController.isLoaded
                  ? //Home Body
                  Expanded(
                      child: Container(
                      child: Column(
                        children: [
                          //Image Banner
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            width: double.maxFinite,
                            height: 200,
                            child: Card(
                              child: Image.asset(
                                'assets/img/foemi_img.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          //Grid View
                          Expanded(
                            child: Container(
                              child: GridView.count(
                                childAspectRatio: 3,
                                primary: false,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5),
                                crossAxisCount: 2,
                                children: List.generate(
                                    dataController.datamodel.state!.length,
                                    (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(LevelScreen.routeName,
                                          arguments:
                                              dataController.datamodel.level);
                                    },
                                    child: Container(
                                      width: double.maxFinite,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.redAccent,
                                              width: 1.5),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight:
                                                  Radius.circular(15))),
                                      child: Center(
                                        child: Text(
                                          dataController.datamodel.state![index]
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                  : Expanded(
                      child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    )),
            ],
          ),
        );
      }),
    );
  }
}
