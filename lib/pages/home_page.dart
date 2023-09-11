import 'package:flutter/material.dart';
import 'package:mb_task2/util/food_title.dart';
import 'package:mb_task2/util/food_type.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List foodType = [
    ['Завтраки',false],
    ['Обеды',true],
    ['Полдники',false],
    ['Десерты',false],
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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person, color: Colors.orange),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.orange,),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: ''),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Вкусная еда для любого ритма жизни!',
            style: GoogleFonts.bebasNeue(
              fontSize:30,
            ),
          ), 
         ),
         const SizedBox(height: 25),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon:  Icon(Icon.search, color: Colors.orange,),
              hintText: 'Найди для себя...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600)),
            ),
          ),
         ),
         const SizedBox(height: 10),
         Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodType.length,
            itemBuilder: (context, index) {
              return FoodType(
                foodType: foodType[index][0], 
                isSelected: foodType[index][0], 
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
                foodImagePath: 'assets/images/corn.png',
                foodName: 'Кукурузный суп',
                foodPrice: '75',
              ),
              FoodTitle(
                foodImagePath: 'assets/images/chiken.png',
                foodName: ' Куриный суп',
                foodPrice: ' 90',
              ),
              FoodTitle(
                foodImagePath: 'assets/images/lentil.png',
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