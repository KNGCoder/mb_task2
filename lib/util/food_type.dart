import 'package:flutter/material.dart';

class FoodType extends StatelessWidget{
  final String foodType;
  final bool isSelect;
  final VoidCallback onTap;
  const FoodType(
    {required this.foodType,
    required this.isSelect,
    required this.onTap,
    super.key} );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          foodType,
          style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isSelect? Colors.lime : Colors.white ),
        ),
      ),
    );
  }
}