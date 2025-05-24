import 'package:flutter/material.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;
import 'package:watchlist_media/services/services.dart';
import 'package:watchlist_media/widgets/HomePage/simple_block.dart';

class NumberdBlock extends StatelessWidget {
  final int number;
  final InfoModal data;
  const NumberdBlock({super.key, required this.number, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Stack(
      children: [
        Padding(
          // padding: EdgeInsets.only(left: size.width*0.13),
          padding: EdgeInsets.only(left:number > 9 ? size.width*0.35*0.2 : 0),
          child: SizedBox(
            width: size.width*0.35,
            height: size.width*0.35*1.3,
            // height: size.width*0.35,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                '$number',
                style: TextStyle(
                  // color: Colors.black,
                  letterSpacing: number>9? -5:0,

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
        Padding(
          padding: EdgeInsets.only(left : number > 9 ? size.width*0.35*0.2 :0),
          child: SimpleBlock(data: data,),
        )
      ],
    );
  }
}