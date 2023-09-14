import 'package:flutter/material.dart';
import 'package:mb_task2/util/food_title.dart';
import 'package:mb_task2/util/food_type.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
String foodType = "true";
bool isCorrect = foodType == 'true';
class _HomePageState extends State<HomePage> {
  final List foodType = [
    ['Завтраки', false],
    ['Обеды', true],
    ['Полдники', false],
    ['Десерты', false],
  ];

  void foodTypeSelected(int index) {
    setState(() {
      for (int i=0; i<foodType.length; i++) {
        foodType[i][1] = false;
      }
      foodType[index][1] = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu, color: Colors.lime),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person, color: Colors.lime),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.limeAccent,),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: ''),
        ], backgroundColor: Colors.amber ),

      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Вкусная еда для любого ритма жизни!',
          style: TextStyle(fontSize: 30, color: Colors.lime[700]),
          ), 
         ),
         const SizedBox(height: 20),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.lime,),
              hintText: 'Найди для себя...',


              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lime.shade900)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lime)),
            ),
          ),
         ),
         const SizedBox(height: 10), //отступ между поиском и меню
         Container(
          height: 50,// высота меню
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodType.length,
            itemBuilder: (context, index) {
              return FoodType(
                foodType: foodType[index][0], 
                isSelect: foodType[index][1],
                onTap: () {
                  foodTypeSelected(index);
                },
              );
            },
          ),
         ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              FoodTitle(
                foodImagePath: 'assets/corn.png',
                foodName: 'Кукурузный суп',
                foodPrice: '75',
              ),
              FoodTitle(
                foodImagePath: 'assets/chicken.png',
                foodName: ' Куриный суп',
                foodPrice: ' 90',
              ),
              FoodTitle(
                foodImagePath: 'assets/lentil.png',
                foodName: ' Суп с чечевицей',
                foodPrice: '83',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}