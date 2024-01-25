import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseReference dbRef;
  Query db = FirebaseDatabase.instance.ref().child('url');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('url');
  final Future<FirebaseApp> _fapp = Firebase.initializeApp();
  String? urls;
  String hotro = "https://68gb.cam/r14";

  @override
  void initState() {
    db = FirebaseDatabase.instance.ref().child("url");
    print(db);
    controller = WebViewController();
    DatabaseReference reference = FirebaseDatabase.instance.ref().child('url');
    DatabaseReference references =
        FirebaseDatabase.instance.ref().child('hotro');
    reference.onValue.listen((event) {
      setState(() {
        urls = event.snapshot.value.toString();
      });
    });
    references.onValue.listen((event) {
      setState(() {
        hotro = event.snapshot.value.toString();
      });
    });
    super.initState();
  }

  late WebViewController controller;
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _fapp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          } else if (snapshot.hasData) {
            return content();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget content() {
    // return Container(
    //   child: Stack(alignment: Alignment.center, children: [
    //     Image.asset(
    //       'assets/home.png',
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height,
    //       fit: BoxFit.cover,
    //     ),
    //     Container(
    //       padding:
    //       EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             MainMenuButtons(
    //               btnText: 'Trang chủ',
    //               onPressed: () async {
    //                 String url = '${urls}';
    //                 if (await canLaunch(url)) {
    //                   await launch(url);
    //                 } else {
    //                   throw 'Could not launch $url';
    //                 }
    //               },
    //             ),
    //           ],
    //         ),
    //
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               MainMenuButtons(
    //                 btnText: 'Hỗ trợ',
    //                 onPressed: () async {
    //                   String url = '${hotro}';
    //                   if (await canLaunch(url)) {
    //                     await launch(url);
    //                   } else {
    //                     throw 'Could not launch $url';
    //                   }
    //                 },
    //               ),
    //             ],
    //           )
    //
    //
    //         ],
    //       ),
    //     )
    //   ]),
    // );
    return WebViewWidget(
        controller: controller
          ..loadRequest(
            Uri.parse(urls ?? "https://68gb.cam/r14"),
          ));
  }
}
