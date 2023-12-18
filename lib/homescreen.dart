import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Uri는 url을 생성하는데 도움을 주는 클래스이다.
  late Uri uri;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    uri = Uri.parse('https://blog.codefactory.ai');
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(uri) // 이 부분은 처음 접속 url =initialUrl
      ..setNavigationDelegate(NavigationDelegate());
    //setNavi..는 해당 페이지에서 다른 링크도 제대로 동작하게 하기 위한 것.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('WebView example'),
        actions: [
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                controller.loadRequest(uri);
              })
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
