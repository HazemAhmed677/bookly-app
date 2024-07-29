import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    required this.widthArea,
    required this.hightArea,
  });
  final double widthArea;
  final double hightArea;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) => SizedBox(
        width: MediaQuery.of(context).size.width * widthArea,
        height: MediaQuery.of(context).size.height * hightArea,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerLoadingForVertical extends StatelessWidget {
  const ShimmerLoadingForVertical({
    super.key,
    required this.widthArea,
    required this.hightArea,
  });
  final double widthArea;

  final double hightArea;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) => SizedBox(
        width: MediaQuery.of(context).size.width * widthArea,
        height: MediaQuery.of(context).size.height * hightArea,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              bottom: 18,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
