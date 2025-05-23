import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;
import 'package:watchlist_media/constants/enums.dart';
import 'package:watchlist_media/services/services.dart';
// import 'package:watchlist_media/constants/nw_images.dart' as nwimgs;

class DiscoverNewImage extends StatelessWidget {
  final InfoModal data;
  const DiscoverNewImage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final String img = 'https://image.tmdb.org/t/p/original/${data.posterPath}';
    Size size = MediaQuery.of(context).size;
    return SizedBox(
          width: size.width,
          child: Row(
            mainAxisSize:MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 0),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 2),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12))
                      
                        ),
                        child: Text(
                          data.mediaType == MediaType.movie ? "Movie" : "TV Show",
                          style: const TextStyle(
                            color: consts.lightColor,
                            fontFamily: "MonoLisaB",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 0.7 * size.width - 12,
                height: 1.5 * 0.7 * size.width - 18, // 1.5 * 12 = 18
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: consts.lightColor,
                  gradient: consts.loadingBG,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)
                ),
              ),
            ],
          ),
        );
  }
}