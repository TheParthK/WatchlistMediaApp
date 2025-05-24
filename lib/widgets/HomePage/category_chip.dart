import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist_media/constants/constants.dart' as consts;

class CategoryChip extends StatelessWidget {
  final String category;
  const CategoryChip(this.category, {super.key});


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 22, 12, 10),
        // margin: const EdgeInsets.fromLTRB(12, 24, 12, 18),
        // margin: const EdgeInsets.fromLTRB(12, 28, 12, 8),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        decoration: const BoxDecoration(
          // color: consts.lightColor,
          // borderRadius: const BorderRadius.all(Radius.circular(25)),
          // border: Border.all(width: 2, color: consts.lightColor)
          border: Border(left: BorderSide(width: 2, color: Color(0xffAB0000)))
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "MonoLisaB",
                // color: Colors.black,
                color: consts.lightColor
              ),
            ),
            // const SizedBox(width: 7,),
            // const Icon( 
            //   CupertinoIcons.forward,
            //   color: consts.lightColor,
            //   // color: Colors.black,
            //   size: 15,
            // )
          ],
        ),
      ),
    );
  }
}