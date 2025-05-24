import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:watchlist_media/constants/enums.dart';
import 'package:watchlist_media/services/services.dart';
import 'package:watchlist_media/widgets/HomePage/category_chip.dart';
import 'package:watchlist_media/widgets/HomePage/simple_block.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Skeletonizer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CategoryChip("### ##### ######"),
          SizedBox(
          height: size.width*0.35*1.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => SimpleBlock(reduceMargin: true, data: InfoModal(genreIDs: [], id: '', mediaType: MediaType.movie, originalLang: '', originalTitle: '', overview: '', posterPath: '/e81hXEqhIklX9eCO1ykaYLejvp9.jpg', releaseDate: '', title: '', voteAvg: '', voteCount: ''),),
            ),
          ),
        ],
      ),
    );
  }
}