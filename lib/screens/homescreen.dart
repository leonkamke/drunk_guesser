import 'package:drunk_guesser/widgets/rounded_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as Rive;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  /*

  Good colors for background:

      Color(0xFFFF5858),
      Color(0xFFB64A4A),

      Color(0xFFFF5858),
      Color(0xFFF87A54),

      Color(0xFF3E5ED9),
      Color(0xFF6EA6F1),

      wie bier:
      Color(0xFFEAA84A),
      Color(0xFFCC700F),

   */

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFEAA84A),
      Color(0xFFCC700F),
    ],
  ));

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: displayWidth,
          height: displayHeight,
          decoration: backgroundDecoration,
          child: Stack(
            children: [
              Container(
                width: 2000,
                height: 2000,
                child: Rive.RiveAnimation.asset('assets/animations/blasen.riv', fit: BoxFit.cover,),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.account_box)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.access_alarm)),
                      ],
                    ),
                  ),
                  Container(
                      width: displayWidth / 1.2,
                      child: Card(
                        color: Color(0xE0443E38),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: displayHeight / 20,
                            ),
                            const Text(
                              "DrunkGuesser",
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: displayHeight / 14,
                            ),
                            Container(
                                width: displayWidth / 1.4,
                                height: 200,
                                child: const Rive.RiveAnimation.asset(
                                    'assets/animations/drunkguesser2.1.riv')),
                            SizedBox(
                              height: displayHeight / 18,
                            ),
                            RoundedButton(buttonText: "Start"),
                            SizedBox(
                              height: displayHeight / 40,
                            ),
                            RoundedButton(buttonText: "Sprachen"),
                            SizedBox(
                              height: displayHeight / 9,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
