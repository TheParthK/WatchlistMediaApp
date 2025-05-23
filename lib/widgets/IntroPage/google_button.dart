import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:watchlist_media/pages/home_page.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedGradientBorder(
        gradientColors: const [Colors.red, Colors.amber, Colors.green, Colors.blue],
        borderRadius:  const BorderRadius.all(Radius.circular(40)),
        stretchAlongAxis: false,
        borderSize: 0.5,
        glowSize: 2,
      // animationProgress: 0.5,
        child: GestureDetector(
          // onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),)),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              // border: Border.all(width: 1, color: Colors.black)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    // color: Colors.black,
                    image: DecorationImage(
                      image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Google_Favicon_2025.svg/1920px-Google_Favicon_2025.svg.png"),
                      fit: BoxFit.contain
                    )
                  ),
                ),
                const SizedBox(width: 20,),
                const Icon(
                  CupertinoIcons.chevron_forward,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}