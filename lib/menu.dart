// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:game/about.dart';
import 'package:game/history_screen.dart';
import 'package:game/main.dart';
import 'package:game/shared_value.dart';
import 'package:game/term.dart';
import 'package:share_plus/share_plus.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff347809),
        automaticallyImplyLeading: true,
        title: const Text("Menu"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xff153a00), Color(0xff347809)],
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 80,
                      child: Image.asset("assets/images/game/logo.png",
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${name_player.$}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text("${phone_player.$}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ))
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("History Score"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => HistoryScoreScreen()));
              },
            ),
            ListTile(
              title: Text("About us"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AboutScreen()));
              },
            ),
            ListTile(
              title: Text("Share"),
              onTap: () {
                _shareText("Do you want to play with me !!!");
              },
            ),
            ListTile(
                title: Text("Terms and Conditions"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => TermScreen()));
                }),
          ],
        ),
      ),
    );
  }

  void _shareText(String text) {
    Share.share(text);
  }
}
