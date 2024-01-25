import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/shared_value.dart';
import 'package:shared_value/shared_value.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xff153a00), Color(0xff347809)],
        )),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ENTER PLAYER NAMES",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: name,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        hintStyle: TextStyle(fontSize: 14),
                        filled: true,
                        fillColor: Colors.black26,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: phone,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(fontSize: 14),
                        filled: true,
                        fillColor: Colors.black26,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: GestureDetector(
                      onTap: () {
                        if (name.text != "" && phone.text != "") {
                          setState(() {
                            name_player.$ = name.text;
                            phone_player.$ = phone.text;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CarRaceHomePage(),
                                // fullscreenDialog: true,
                              ));
                        }
                      },
                      child: Center(
                        child: Text("START GAME"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
