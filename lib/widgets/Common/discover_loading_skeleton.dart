import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DiscoverLoadingSkeleton extends StatelessWidget {
  const DiscoverLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Skeletonizer(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 0.7 * size.width - 12,
          height: double.infinity,
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/transparent.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
        ),
      ),
    );
  }
}