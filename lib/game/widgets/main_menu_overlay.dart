import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/game/car_race.dart';
import 'package:game/menu.dart';
import 'package:game/shared_value.dart';

class MainMenuOverlay extends StatefulWidget {
  const MainMenuOverlay(this.game, {super.key});

  final Game game;

  @override
  State<MainMenuOverlay> createState() => _MainMenuOverlayState();
}

class _MainMenuOverlayState extends State<MainMenuOverlay> {
  Character character = Character.tesla;

  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    CarRace game = widget.game as CarRace;

    return LayoutBuilder(builder: (context, constraints) {
      final TextStyle titleStyle = (constraints.maxWidth > 830)
          ? Theme.of(context).textTheme.displayLarge!
          : Theme.of(context).textTheme.displaySmall!;

      return Material(
        // color: Theme.of(context).colorScheme.background,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/game/background.jpg"))),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi, ${name_player.$}',
                          style: titleStyle.copyWith(
                            height: .4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text('Choose your favourite car type',
                              style:
                                  Theme.of(context).textTheme.headlineSmall!),
                        ),
                        const WhiteSpace(height: 30),
                        Container(
                          height: 370,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: ListWheelScrollView(
                              controller: fixedExtentScrollController,
                              physics: const FixedExtentScrollPhysics(),
                              itemExtent: 360.0,
                              diameterRatio: 100000,
                              children: [
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: CharacterButton(
                                      character: Character.tesla,
                                      selected: character == Character.tesla,
                                      onSelectChar: () {
                                        setState(() {
                                          character = Character.tesla;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: CharacterButton(
                                      character: Character.farari,
                                      selected: character == Character.farari,
                                      onSelectChar: () {
                                        setState(() {
                                          character = Character.farari;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: CharacterButton(
                                      character: Character.lambo,
                                      selected: character == Character.lambo,
                                      onSelectChar: () {
                                        setState(() {
                                          character = Character.lambo;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: CharacterButton(
                                      character: Character.bmw,
                                      selected: character == Character.bmw,
                                      onSelectChar: () {
                                        setState(() {
                                          character = Character.bmw;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: CharacterButton(
                                      character: Character.tarzen,
                                      selected: character == Character.tarzen,
                                      onSelectChar: () {
                                        setState(() {
                                          character = Character.tarzen;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                RotatedBox(
                                    quarterTurns: 1,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: CharacterButton(
                                        character: Character.tata,
                                        selected: character == Character.tata,
                                        onSelectChar: () {
                                          setState(() {
                                            character = Character.tata;
                                          });
                                        },
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const WhiteSpace(height: 50),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              game.gameManager.selectCharacter(character);
                              game.startGame();
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                const Size(100, 50),
                              ),
                              textStyle: MaterialStateProperty.all(
                                  Theme.of(context).textTheme.titleLarge),
                            ),
                            child: const Text('Start'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => const Menu()));
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 35,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class CharacterButton extends StatelessWidget {
  const CharacterButton({
    super.key,
    required this.character,
    this.selected = false,
    required this.onSelectChar,
  });

  final Character character;
  final bool selected;
  final void Function() onSelectChar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          color: (selected)
              ? Colors.green.withOpacity(0.8)
              : Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: onSelectChar,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Image.asset(
                'assets/images/game/${character.name}.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const Spacer(),
              Text(
                character.name,
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WhiteSpace extends StatelessWidget {
  const WhiteSpace({super.key, this.height = 100});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
