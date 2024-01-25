import 'package:flutter/material.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Terms and conditions"),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Last updated: ${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}",
              ),
              Text(
                  "\n\t\t\t\t\t\t\tWelcome to GB_68Car, a thrilling racing game where your skills determine how far you can go! Before you start enjoying the adrenaline rush, please take a moment to read and understand the following terms and conditions.\n"),
              Text(
                "1. Acceptance of Terms:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "By downloading, installing, or playing GB_68Car, you agree to abide by these terms and conditions. If you do not agree, please do not use the game.\n"),
              Text(
                "2. Gameplay:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "GB_68Car is a simple yet exciting racing game where players control a car, navigating it left or right to avoid obstacles. The longer you survive, the higher your score.\n"),
              Text(
                "3. Age Restriction:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "GB_68Car is intended for players of all ages. However, parental guidance is advised for younger players. By using the game, you affirm that you are of legal age to enter into this agreement.\n"),
              Text(
                "4. Scoring:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "BYour score is determined by the distance covered in the game. The longer you avoid obstacles and survive, the higher your score will be.\n"),
              Text(
                "5. User Conduct:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "Do not use GB_68Car for any unlawful purpose.\nRespect the rights of other players.\nDo not engage in cheating, hacking, or any form of unfair play.\nDo not attempt to disrupt the proper functioning of the game.\n"),
              Text(
                "6. Privacy:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "GB_68Car may collect certain data for the purpose of improving gameplay and user experience. Please refer to our Privacy Policy for more information on data collection and usage.\n"),
              Text(
                "7. Updates:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "From time to time, updates may be released to enhance gameplay or address issues. It is your responsibility to keep the game updated for optimal performance.\n"),
              Text(
                "8. Intellectual Property::",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "All intellectual property rights related to GB_68Car, including but not limited to graphics, design, and code, are owned by the developers. You may not reproduce, distribute, or use any part of the game without permission.\n"),
              Text(
                "9. Limitation of Liability:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "The developers of GB_68Car are not liable for any damages or losses incurred while using the game. Play responsibly and be aware of your surroundings.\n"),
              Text(
                "10. Termination:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "The developers reserve the right to terminate or suspend your access to GB_68Car at any time without prior notice for violating these terms and conditions.\n"),
              Text(
                "11. Contact Information:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  "For any inquiries or concerns regarding GB_68Car, please contact us at [support@email.com]\n"),
            ]),
          )),
    );
  }
}
