import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("About Us"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Text(
              "\t\t\t\t\t\t\tWelcome to the thrilling world of GB_68Car, where speed, strategy, and survival collide in a compact gaming experience like no other! GB_68Car is not just a racing game; it's an adrenaline-pumping journey that puts your reflexes to the test as you navigate a sleek car through challenging terrain.\n\n\t\t\t\t\t\t\tIn this small yet dynamic game, simplicity meets excitement. The premise is straightforward – direct your car left or right to avoid obstacles, and the longer you survive, the higher your score climbs. GB_68Car is designed to provide a quick and intense burst of entertainment, making it the perfect choice for those moments when you crave a gaming challenge on the go.\n\n\t\t\t\t\t\t\tWhat sets GB_68Car apart is its focus on skillful maneuvering and strategic decision-making. As you race through the ever-changing landscape, you'll need sharp reflexes to dodge obstacles and make split-second decisions to keep your car on the track. The minimalistic design and intuitive controls ensure that players of all levels can dive right in and experience the thrill of the race.\n\n\t\t\t\t\t\t\tBut GB_68Car isn't just about racking up points – it's about the joy of the ride. The game's vibrant graphics and dynamic sound effects create an immersive environment that keeps you engaged from the moment you hit the road. Challenge yourself to beat your high score, compete with friends, and experience the rush of conquering new levels.\n\n\t\t\t\t\t\t\tWhether you're a casual gamer looking for a quick escape or a seasoned player seeking a new challenge, GB_68Car offers a racing experience that is both accessible and exhilarating. Get ready to rev up your engines, navigate through twists and turns, and embrace the excitement of GB_68Car – the ultimate small game with big thrills!"),
        ),
      ),
    );
  }
}
