import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;
import 'package:watchlist_media/services/services.dart';
import 'package:watchlist_media/widgets/Common/loading_skeleton.dart';
import 'package:watchlist_media/widgets/HomePage/category_chip.dart';
import 'package:watchlist_media/widgets/HomePage/discover_new_widget.dart';
import 'package:watchlist_media/widgets/HomePage/numberd_block.dart';
import 'package:watchlist_media/widgets/HomePage/simple_block.dart';
import 'package:watchlist_media/widgets/HomePage/top_bar.dart';
import 'package:watchlist_media/constants/nw_images.dart' as nwimgs;


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets dpad = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          
          ListView(
            padding: EdgeInsets.zero,
            children: [
                SizedBox(height: dpad.top + 60 + 20,),
                DiscoverNewWidget(),

                FutureBuilder(
                  future: APIService.trendingMovies(),
                  builder: (context, snapshot) => snapshot.hasData?
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CategoryChip("Trending Movies"),
                      SizedBox(
                        height: size.width*0.35*1.3,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:  [
                            ...snapshot.data!.asMap().entries.map((entry)=> SimpleBlock(data: entry.value, reduceMargin: true,))
                          ],
                        )
                      ),
                    ],
                  ) : const LoadingSkeleton(),
                ),


                FutureBuilder(
                  future: APIService.popularTv(),
                  builder: (context, snapshot) => snapshot.hasData?
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CategoryChip("Popular TV"),
                      SizedBox(
                        height: size.width*0.35*1.3,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:  [
                            ...snapshot.data!.asMap().entries.map((entry)=> SimpleBlock(data: entry.value, reduceMargin: true,))
                          ],
                        )
                      ),
                    ],
                  ) : const LoadingSkeleton(),
                ),



                FutureBuilder(
                  future: APIService.topRatedMovies(),
                  builder: (context, snapshot) => snapshot.hasData?
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CategoryChip("Top Rated Movies"),
                      SizedBox(
                        height: size.width*0.35*1.3,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:  [
                            ...snapshot.data!.asMap().entries.map((entry)=> NumberdBlock(number: entry.key+1, data: entry.value))
                          ],
                        )
                      ),
                    ],
                  ) : const LoadingSkeleton(),
                ),
                

                const SizedBox(height: 400,),


            ],
          ),


          //  TOP APP BAR - YAHA MAT GHUS JAANA GLTI SE BRO
          const TopBar()
        ],
      ),
    );
  }
}