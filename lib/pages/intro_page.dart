import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchlist_media/constants/nw_images.dart' as imagesPathsN;
import 'package:watchlist_media/widgets/IntroPage/google_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding; 
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(12, devicePadding.top+20, 12, devicePadding.bottom+10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imagesPathsN.introBG),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),

          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/watchlistmedialogo.svg',
                  fit: BoxFit.contain,
                  height: size.width/7,
                ),
                const Text(
                  '/',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                SvgPicture.asset(
                  'assets/images/wmsh.svg',
                  fit: BoxFit.contain,
                  height: size.width/8,
                ),
              ],
            ),
            const ContinueWithGoogle(),
            // const Container(height: 10,)
            const Text(
              "Se7en\n1995\nDavid Fincher",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: "monolisathin"

              ),
            )
          ],
        ),
      ),
    );
  }
}