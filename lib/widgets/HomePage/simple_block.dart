import 'package:flutter/material.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;
import 'package:watchlist_media/services/services.dart';

class SimpleBlock extends StatelessWidget {
  final InfoModal? data;
  final bool reduceMargin;
  const SimpleBlock({super.key, this.data, this.reduceMargin = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
    width: size.width*0.35,
    height: size.width*0.35*1.3,
    margin: !reduceMargin?EdgeInsets.only(left: size.width*0.12, right: 7.5):const EdgeInsets.only(left: 12, right: 0),
    decoration:  BoxDecoration(
      color: Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(18)),
      gradient: consts.loadingBG,
      image: data!=null? DecorationImage(image: NetworkImage(consts.fullImgPath(data!.posterPath)), fit: BoxFit.cover):null,
      // boxShadow: [BoxShadow(blurRadius: 1, color: consts.lightColor, )]
    ),

  );
  }
}