import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/controller/identity_controller.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:mm_school/data/api/eclass_api_client.dart';
import 'package:mm_school/data/api/identity_api.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:mm_school/data/repository/eclass_repository.dart';
import 'package:mm_school/data/repository/identity_repository.dart';
import 'package:mm_school/page/Identity/check_identity_screen.dart';
import 'package:mm_school/page/Identity/identity_card.dart';
import 'package:mm_school/page/batch/batch_screen.dart';
import 'package:mm_school/page/eclass_grade/eclass_grade.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:mm_school/page/lesson/lesson_screen.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/page/splash_screen.dart';
import 'package:mm_school/page/subject/subject_screen.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

bool isInternet = false;

Future<void> _checkConnectivityState() async {
  final ConnectivityResult result = await Connectivity().checkConnectivity();

  if (result == ConnectivityResult.wifi) {
    print('Connected to a Wi-Fi network');
    isInternet = true;
  } else if (result == ConnectivityResult.mobile) {
    print('Connected to a mobile network');
    isInternet = true;
  } else {
    print('Not connected to any network');
    isInternet = false;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await init();
  await _checkConnectivityState();
  Get.find<AdController>().loadAd(AppConstant.FIRST_AD_UNIT, null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<DataController>().getData();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MM School',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      home: const HomeScreen(),
      initialRoute: SplashScreen.routeName,
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: LevelScreen.routeName,
          page: () => const LevelScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: GradeScreen.routeName,
          page: () => const GradeScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: SubjectScreen.routeName,
          page: () => const SubjectScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: BatchScreen.routeName,
          page: () => const BatchScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: EclassGrade.routeName,
          page: () => const EclassGrade(),
          transition: Transition.fade,
        ),
        GetPage(
          name: LessonScreen.routeName,
          page: () => const LessonScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: CheckIdentityScreen.routeName,
          page: () => const CheckIdentityScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: IdentityCard.routeName,
          page: () => const IdentityCard(),
          transition: Transition.fade,
        ),
      ],
    );
  }
}

Future<void> init() async {
  //Put api_client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));
  Get.lazyPut(() => EClassApiClient(appBaseUrl: AppConstant.ECLASS_BASE_URL));
  Get.lazyPut(() => IdentityApi(appBaseUrl: AppConstant.IDENTITY_BASE_URL));

  //Put Repository
  Get.lazyPut(() => DataRepo(apiClient: Get.find()));
  Get.lazyPut(() => EClassRepo(apiClient: Get.find()));
  Get.lazyPut(() => IdentityRepo(apiClient: Get.find()));

  //Put Controller
  Get.lazyPut(() => DataController(dataRepo: Get.find()));
  Get.put(DialogController());
  Get.put(AdController());
  Get.put(EclassController(eClassRepo: Get.find()));
  Get.put(IdentityController(identityRepo: Get.find()));
}
