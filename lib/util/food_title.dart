import 'package:flutter/material.dart';

class FoodTitle extends StatelessWidget{
  final String foodImagePath;
  final String foodName;
  final String foodPrice;
  
  const FoodTitle(
    {required this.foodImagePath,
    required this.foodName,
    required this.foodPrice,
    super.key} );

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 50.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          
          color: Colors.lime.shade700,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image food
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 200,
              height: 150,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(foodImagePath), ),
            ),
          ),
         
          Padding (
            padding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox( height: 4),
              ],
            ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$foodPrice rub.'),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.add),
                  )
              ]),
            )
            ],
        ),
      ),
      );
  }
}