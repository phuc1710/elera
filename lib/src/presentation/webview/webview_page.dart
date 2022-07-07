import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/params/appbar_params.dart';
import '../widgets/base_appbar.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key, required this.url}) : super(key: key);

  final String? url;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        AppBarParams(
          context,
          title: 'Security',
          backgroundColor: Colors.white,
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: (widget.url?.isNotEmpty == true)
            ? WebView(initialUrl: widget.url)
            : const Center(child: Text('chưa có nội dung')),
      ),
    );
  }
}
