import 'package:flutter/material.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;

class SimpleBlock extends StatelessWidget {
  final String? img;
  final bool reduceMargin;
  const SimpleBlock({super.key, this.img, this.reduceMargin = false});

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
      image: img!=null? DecorationImage(image: NetworkImage(img!), fit: BoxFit.cover):null
    ),

  );
  }
}