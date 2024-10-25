import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<void> _handleBackNavigation(bool didPop, Object? result) async {
    if (!didPop && await controller.canGoBack()) {
      controller.goBack();
    } else if (!didPop) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: _handleBackNavigation,
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          '블로그',
          style: TextStyle(color: Colors.black),
        )),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
