import 'package:flutter/material.dart';
import 'package:game/shared_value.dart';

class HistoryScoreScreen extends StatefulWidget {
  const HistoryScoreScreen({super.key});

  @override
  State<HistoryScoreScreen> createState() => _HistoryScoreScreenState();
}

class _HistoryScoreScreenState extends State<HistoryScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Your History Score"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: history_score.$.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Row(
                children: [
                  Text("${index + 1}:"),
                  SizedBox(
                    width: 15,
                  ),
                  Text("${history_score.$[index]}")
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
