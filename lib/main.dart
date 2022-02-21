import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/page/subject/subject_screen.dart';
import 'package:mm_school/utils/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<DataController>().getData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      initialRoute: HomeScreen.routeName,
      getPages: [
        GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
        GetPage(name: LevelScreen.routeName, page: () => LevelScreen()),
        GetPage(name: GradeScreen.routeName, page: () => GradeScreen()),
        GetPage(name: SubjectScreen.routeName, page: () => SubjectScreen()),
      ],
    );
  }
}

Future<void> init() async {
  //Put api_client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

  //Put Repository
  Get.lazyPut(() => DataRepo(apiClient: Get.find()));

  //Put Controller
  Get.lazyPut(() => DataController(dataRepo: Get.find()));
}
