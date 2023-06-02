import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/app_strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../controllers/language_controller.dart';
class WebViewScreen extends StatelessWidget {
  final String url;
   const WebViewScreen({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(),icon: const Icon(Icons.home,color: Colors.white,),),
       backgroundColor: const Color(0xffF7F9F6),
        elevation: 0,
      ),
      body: WebViewWidget(
        controller: controller,
        layoutDirection: Get.find<LanguageController>().locale != eng
            ? TextDirection.rtl
            : TextDirection.ltr,
      ),
    );
  }

}
