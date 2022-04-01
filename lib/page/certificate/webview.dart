import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mm_school/utils/dimension.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EclassWebView extends StatefulWidget {
  static const routeName = '/webView';
  const EclassWebView({Key? key}) : super(key: key);

  @override
  State<EclassWebView> createState() => _WebViewState();
}

class _WebViewState extends State<EclassWebView> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text('Graduation Survey',
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
          children: const [
            Expanded(
                child: WebView(
              initialUrl:
                  'https://forms.office.com/Pages/ResponsePage.aspx?id=9neVOSF_0ka1NUloNC_nTCm6zjhDOKNGs7TMzTekNqVURVlTNDdUTFFLODJKRk1TWFNTUkNMUFUxNy4u&embed=true',
              javascriptMode: JavascriptMode.unrestricted,
            ))
          ],
        ),
      ),
    );
  }
}
