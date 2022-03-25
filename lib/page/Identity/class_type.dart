import 'package:flutter/material.dart';
import 'package:mm_school/page/Identity/check_identity_screen.dart';
import 'package:mm_school/page/widgets/comingsoon_dialog.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:mm_school/utils/globleOnClick.dart';

class ClassType extends StatelessWidget {
  static const routeName = '/classType';
  const ClassType({Key? key}) : super(key: key);

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
        width: MediaQuery.of(context).size.width,
        height:
            MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(Dimension.height20),
            child: Card(
              elevation: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: Dimension.height20,
                  ),

                  Text(
                    'Select your class type',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[400]),
                  ),

                  SizedBox(
                    height: Dimension.height20,
                  ),
                  //E - Classes
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimension.height20, right: Dimension.height20),
                    child: GestureDetector(
                      onTap: () {
                        GlobleOnClick().onClick(AppConstant.FIRST_AD_UNIT, null,
                            CheckIdentityScreen.routeName, null, context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: Dimension.height50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.height50 / 2),
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
                        ),
                        child: Center(
                          child: Text(
                            'E - Classes',
                            style: TextStyle(
                                color: Colors.blue[400],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  //Zoom - Classes
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimension.height20, right: Dimension.height20),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimension.height20)),
                                child: const ComingDialog(),
                              );
                            });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: Dimension.height50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.height50 / 2),
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
                        ),
                        child: Center(
                          child: Text(
                            'Zoom - Classes',
                            style: TextStyle(
                                color: Colors.blue[400],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
