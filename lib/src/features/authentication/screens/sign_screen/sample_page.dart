
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../controllers/web_view_controller.dart';

class SamplePageScreen extends StatelessWidget{
  const SamplePageScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(''),
      ),
      body: WebViewWidget(
        controller: controller
      ),
    );
  }
}