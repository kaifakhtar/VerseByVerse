import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:verse_by_verse/utils/colors.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          period: Duration(milliseconds: 500),
            baseColor: Color(0xffDAE6FF),
            highlightColor: Colors.white,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                height:15,width: 500)),
        SizedBox(height: 20),
        Shimmer.fromColors(
            period: Duration(milliseconds: 500),
            baseColor: Color(0xffDAE6FF),
            highlightColor: Colors.white,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),height:15,width: 300)),
        SizedBox(height: 20),
        Shimmer.fromColors(
            period: Duration(milliseconds: 500),
            baseColor: Color(0xffDAE6FF),
            highlightColor: Colors.white,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),height:15,width: 200)),
        SizedBox(height: 20),
        Shimmer.fromColors(
            period: Duration(milliseconds: 500),
            baseColor: Color(0xffDAE6FF),
            highlightColor: Colors.white,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),height:15,width: 500)),
        const SizedBox(height: 20),
        Shimmer.fromColors(
            period: const Duration(milliseconds: 500),
            baseColor: AppColors.lightBlueColor,
            highlightColor: Colors.white,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),height:15,width: 400)),

        const SizedBox(height: 80),
        Shimmer.fromColors(
            period: const Duration(milliseconds: 500),
            baseColor: AppColors.lightBlueColor,
            highlightColor: Colors.white,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),height:15,width: 500)),
        const SizedBox(height: 20),
        Shimmer.fromColors(
            period: const Duration(milliseconds: 500),
            baseColor: AppColors.lightBlueColor,
            highlightColor: Colors.white,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),height:15,width: 600)),
        const SizedBox(height: 20),
        Shimmer.fromColors(
            period: const Duration(milliseconds: 500),
            baseColor: AppColors.lightBlueColor,
            highlightColor: Colors.white,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),height:15,width: 300)),
        const SizedBox(height: 20),
        Shimmer.fromColors(
            period: const Duration(milliseconds: 500),
            baseColor: AppColors.lightBlueColor,
            highlightColor: Colors.white,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),height:15,width: 200)),


      ],
    );
  }
}
