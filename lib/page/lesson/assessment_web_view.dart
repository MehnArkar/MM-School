import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AssessmentWebView extends StatefulWidget {
  static const routeName = '/assessmentWebView';
  const AssessmentWebView({Key? key}) : super(key: key);

  @override
  State<AssessmentWebView> createState() => _AssessmentWebViewState();
}

class _AssessmentWebViewState extends State<AssessmentWebView> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    String assessmentUrl = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text('Assessment',
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
        body: Column(
          children: [
            Expanded(
                child: WebView(
              initialUrl: assessmentUrl,
              javascriptMode: JavascriptMode.unrestricted,
            ))
          ],
        ),
      ),
    );
  }
}
