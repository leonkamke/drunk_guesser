import 'package:drunk_guesser/provider/categories_startbutton_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';

class StartButton extends StatelessWidget {
  final void Function() onTap;
  const StartButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          fixedSize: const Size(110, 40),
          foregroundColor: const Color(0xFF989898),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.schriftFarbe_hell,
          shadowColor: Colors.black,
          elevation: 7
        ),
        onPressed: context.watch<StartButtonProvider>().disabled ? null : onTap,
        child: const FittedBox(
          child: Text(
            "Start",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
              color: AppColors.schriftFarbe_startbutton,
            ),
          ),
        ),
    );
  }
}
