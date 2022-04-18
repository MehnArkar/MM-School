import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/controller/ad_controller.dart';
import 'package:mm_school/controller/auth_controller.dart';
import 'package:mm_school/controller/certificate_controller.dart';
import 'package:mm_school/controller/data_controller.dart';
import 'package:mm_school/controller/dialog_controller.dart';
import 'package:mm_school/controller/eclass_controller.dart';
import 'package:mm_school/controller/examroom_controller.dart';
import 'package:mm_school/controller/identity_controller.dart';
import 'package:mm_school/data/api/api_client.dart';
import 'package:mm_school/data/api/certificate_api.dart';
import 'package:mm_school/data/api/eclass_api_client.dart';
import 'package:mm_school/data/api/exam_api.dart';
import 'package:mm_school/data/api/identity_api.dart';
import 'package:mm_school/data/repository/certificate_responsitory.dart';
import 'package:mm_school/data/repository/data_repository.dart';
import 'package:mm_school/data/repository/eclass_repository.dart';
import 'package:mm_school/data/repository/exam_repository.dart';
import 'package:mm_school/data/repository/identity_repository.dart';
import 'package:mm_school/page/Identity/check_identity_screen.dart';
import 'package:mm_school/page/Identity/class_type.dart';
import 'package:mm_school/page/Identity/identity_card.dart';
import 'package:mm_school/page/auth/otp_screen.dart';
import 'package:mm_school/page/auth/sign_in.dart';
import 'package:mm_school/page/auth/sign_up.dart';
import 'package:mm_school/page/batch/batch_screen.dart';
import 'package:mm_school/page/certificate/ZclassForm.dart';
import 'package:mm_school/page/certificate/certificate_classtype.dart';
import 'package:mm_school/page/certificate/download_certificate.dart';
import 'package:mm_school/page/certificate/eclass_form.dart';
import 'package:mm_school/page/certificate/webview.dart';
import 'package:mm_school/page/eclass_grade/eclass_grade.dart';
import 'package:mm_school/page/exam_room/eclass_info.dart';
import 'package:mm_school/page/exam_room/exam_classtype.dart';
import 'package:mm_school/page/exam_room/exam_eclass.dart';
import 'package:mm_school/page/exam_room/exam_zclass.dart';
import 'package:mm_school/page/exam_room/zclass_info.dart';
import 'package:mm_school/page/grade/grade_screen.dart';
import 'package:mm_school/page/home/home_screen.dart';
import 'package:mm_school/page/lesson/assessment_web_view.dart';
import 'package:mm_school/page/lesson/lesson_screen.dart';
import 'package:mm_school/page/lesson/lesson_web_view.dart';
import 'package:mm_school/page/level/level_screen.dart';
import 'package:mm_school/page/splash_screen.dart';
import 'package:mm_school/page/subject/subject_screen.dart';
import 'package:mm_school/utils/constant.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

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

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await init();
  await FlutterDownloader.initialize(debug: true);
  await _checkConnectivityState();
  HttpOverrides.global = MyHttpOverrides();
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
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Raleway',
      ),
      home: const SignIn(),
      initialRoute: SplashScreen.routeName,
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: LevelScreen.routeName,
          page: () => const LevelScreen(),
        ),
        GetPage(
          name: GradeScreen.routeName,
          page: () => const GradeScreen(),
        ),
        GetPage(
          name: SubjectScreen.routeName,
          page: () => const SubjectScreen(),
        ),
        GetPage(
          name: BatchScreen.routeName,
          page: () => const BatchScreen(),
        ),
        GetPage(
          name: EclassGrade.routeName,
          page: () => const EclassGrade(),
        ),
        GetPage(
          name: LessonScreen.routeName,
          page: () => const LessonScreen(),
        ),
        GetPage(
          name: CheckIdentityScreen.routeName,
          page: () => const CheckIdentityScreen(),
        ),
        GetPage(
          name: IdentityCard.routeName,
          page: () => const IdentityCard(),
        ),
        GetPage(
          name: ClassType.routeName,
          page: () => const ClassType(),
        ),
        GetPage(
          name: CertificateClassType.routeName,
          page: () => const CertificateClassType(),
        ),
        GetPage(
          name: EclassForm.routeName,
          page: () => const EclassForm(),
        ),
        GetPage(
          name: ZClassForm.routeName,
          page: () => const ZClassForm(),
        ),
        GetPage(
          name: EclassWebView.routeName,
          page: () => const EclassWebView(),
        ),
        GetPage(
          name: DownloadCertificate.routeName,
          page: () => const DownloadCertificate(),
        ),
        GetPage(
          name: ExamClassType.routeName,
          page: () => const ExamClassType(),
        ),
        GetPage(
          name: ExamZclass.routeName,
          page: () => const ExamZclass(),
        ),
        GetPage(
          name: ExamEclass.routeName,
          page: () => const ExamEclass(),
        ),
        GetPage(
          name: EclassInfo.routeName,
          page: () => const EclassInfo(),
        ),
        GetPage(
          name: ZclassInfo.routeName,
          page: () => const ZclassInfo(),
        ),
        GetPage(
          name: LessonWebView.routeName,
          page: () => const LessonWebView(),
        ),
        GetPage(
          name: AssessmentWebView.routeName,
          page: () => const AssessmentWebView(),
        ),
        GetPage(
            name: SignUp.routeName,
            page: () => const SignUp(),
            transition: Transition.rightToLeft),
        GetPage(
            name: OtpScreen.routeName,
            page: () => const OtpScreen(),
            transition: Transition.rightToLeft),
      ],
    );
  }
}

Future<void> init() async {
  //Put api_client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));
  Get.lazyPut(() => EClassApiClient(appBaseUrl: AppConstant.ECLASS_BASE_URL));
  Get.lazyPut(() => IdentityApi(appBaseUrl: AppConstant.IDENTITY_BASE_URL));
  Get.lazyPut(() => CertificateApi(baseUrl: AppConstant.CERTIFICATE_BASE_URL));
  Get.lazyPut(() => ExamApi(baseUrl: AppConstant.EXAM_BASE_URL));

  //Put Repository
  Get.lazyPut(() => DataRepo(apiClient: Get.find()));
  Get.lazyPut(() => EClassRepo(apiClient: Get.find()));
  Get.lazyPut(() => IdentityRepo(apiClient: Get.find()));
  Get.lazyPut(() => CertificateRepo(apiClient: Get.find()));
  Get.lazyPut(() => ExamRepo(apiClient: Get.find()));

  //Put Controller
  Get.lazyPut(() => DataController(dataRepo: Get.find()));
  Get.put(DialogController());
  Get.put(AdController());
  Get.put(EclassController(eClassRepo: Get.find()));
  Get.put(IdentityController(identityRepo: Get.find()));
  Get.put(CertificateController(certificateRepo: Get.find()));
  Get.put(ExamRoomController(examRepo: Get.find()));
  Get.put(AuthController(dataRepo: Get.find()));
}
