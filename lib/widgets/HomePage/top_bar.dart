import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;
import 'package:watchlist_media/pages/developers_page.dart';
import 'package:watchlist_media/services/services.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets dpad = MediaQuery.of(context).padding;
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black26,
              // borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              // boxShadow: [BoxShadow(color: consts.lightColor, offset: Offset(0, 10), blurRadius: 4)]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: dpad.top + 10,),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: consts.lightColor,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: SvgPicture.asset(
                          "assets/images/wmshalt.svg",
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: const BoxDecoration(
                          color: consts.lightColor,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => APIService.topRatedMovies(),
                              child: const Icon(CupertinoIcons.search, color: Colors.black,)),
                            Container(
                              width: 2,
                              height: 15,
                              margin: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DevelopersPage(),)),
                              child: const Icon(CupertinoIcons.staroflife_fill, color: Colors.black,)
                            ),
                            Container(
                              width: 2,
                              height: 15,
                              margin: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                              ),
                            ),
                            const Icon(CupertinoIcons.circle_grid_3x3_fill , color: Colors.black,),
                          ],
                        ),
                      )
            
                    ],
                  ),
                const SizedBox(height: 6,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}