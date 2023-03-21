import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/drawer.dart';

class WebAppPage extends StatefulWidget {
  const WebAppPage({Key? key}) : super(key: key);

  static const routeName = '/webapp';

  @override
  State<WebAppPage> createState() => _WebAppPageState();
}

class _WebAppPageState extends State<WebAppPage> {
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0xFF2a5298))
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
  ..loadRequest(Uri.parse('https://smd-insurancetech.streamlit.app/Estimar_Chance'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: const Color(0xFF2a5298),
          centerTitle: true,
          title: SizedBox(
            width: 90,
            child: Image.asset("assets/logo.png"),
          ),
          actions: [
            IconButton(
              tooltip: 'Refresh',
              onPressed: (){
                controller.reload();
              },
              icon: const Icon(Icons.refresh_outlined)),
          ],
        ),
      body: WebViewWidget(controller: controller)
    );
  }
}