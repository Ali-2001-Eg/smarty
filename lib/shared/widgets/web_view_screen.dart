import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(),icon: Icon(Icons.arrow_back_ios,color: Colors.white70,),),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff1A3993),
        centerTitle: true,
        title: Text(
          'Smarty',
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: const Color(0xffFEA633)),
        ),
        actions: const [
          // IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/logo.png'),
          )
        ],
      ),
      body:WebView(
        initialUrl: url,
      ),
    );
  }
}
