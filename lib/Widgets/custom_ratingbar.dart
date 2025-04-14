import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingbar extends StatefulWidget {
  final double initialRating;
  final Function(double)onRatingUpdate;
  const CustomRatingbar({super.key, required this.initialRating, required this.onRatingUpdate});

  @override
  State<CustomRatingbar> createState() => _CustomRatingbarState();
}

class _CustomRatingbarState extends State<CustomRatingbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [




        ],
      ),
    );
  }
}
