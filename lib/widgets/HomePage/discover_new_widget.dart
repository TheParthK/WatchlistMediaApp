import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;
import 'package:watchlist_media/constants/nw_images.dart' as nwimgs;
import 'package:watchlist_media/services/services.dart';
import 'package:watchlist_media/widgets/Common/discover_loading_skeleton.dart';
import 'package:watchlist_media/widgets/HomePage/discover_new_image.dart';

class DiscoverNewWidget extends StatelessWidget {
  const DiscoverNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 0.66x width - 24?? maybe dekhte h
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 1.5 * 0.7 * size.width - 18,
            child: RotatedBox(
              quarterTurns: 3,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'TRY', // hot new try buzz
                    style: TextStyle(
                    // color: Colors.black,
                    height: 0.7,
                    letterSpacing: -1,
                    fontFamily: "MonoLisaBBI",
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 0.3
                      ..color = consts.lightColor,
                  ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.5 * 0.7 * size.width - 18,
          child: FutureBuilder(
            future: APIService.discoverMulti(),
            builder: (context, snapshot) => snapshot.hasData?
            PageView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              // reverse: true,
              // padding: EdgeInsets.zero,
              children: [
                ...snapshot.data!.map((data)=>DiscoverNewImage(data))
              ],
            ) : const DiscoverLoadingSkeleton()
          ),
        )
      ],
    );
  }
}