import 'package:flutter/material.dart';
import 'package:mb_task2/util/food_title.dart';
import 'package:mb_task2/util/food_type.dart';
import 'package:readmore/readmore.dart';


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
        ], backgroundColor: Colors.lime[900] ),

      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Вкусная еда для любого ритма жизни!',
          style: TextStyle(fontSize: 30, color: Colors.lime[700]),
          ), 
         ),
         const SizedBox(height: 20),// отступ между надписью и поиском
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),// отступ снаружи поиска
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.lime,),
              hintText:'Найди для себя...',
              hintStyle: const TextStyle(color:Colors.lime),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lime.shade900)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lime)),
            ),
          ),
         ),
         const SizedBox(height: 10), //отступ между поиском и меню
        Expanded(
          child:ListView(
            scrollDirection: Axis.vertical,
              children: [
                SizedBox(
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
             SizedBox(
              height: 290,
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
           Padding(
             padding: const EdgeInsets.all(10.0),
             child:Container(
               padding: const EdgeInsets.all(7.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.lime.shade100,
               ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [

                   Text(
                       'СУП НЕДЕЛИ',
                       style: TextStyle(
                           fontSize: 29,
                           color: Colors.lime[700],
                            ),
                     ),
                     Text(
                       'Чечевичный',
                       style: TextStyle(fontSize: 25, color: Colors.lime[700],),
                     ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
                     child: ReadMoreText(
                         Texts.ext1,
                         style: TextStyle(fontSize: 23, color: Colors.lime[600]),
                       trimLines: 6,
                       colorClickableText:Colors.lime.shade900,
                       trimMode: TrimMode.Line,
                       trimCollapsedText:'подробнее',
                       trimExpandedText: 'скрыть',
                     ),
                   ),
                   ],
                 ),
             ),
           ),
       ]
       )
       ),
      ]),
    );
  }
}
class Texts{
  static const String ext1 = 'Чечевица – одна из древнейших бобовых культур. Упоминания о блюдах из чечевицы встречаются в трудах античных историков, а первые рецепты — в древнеримской кулинарной книге легендарного гурмана I в. н. э. Марка Габия Апиция.Супу из чечевицы отдавал должное и древнегреческий комедиограф Аристофан, считавший эту еду «слаще всех деликатесов».Но, легендарным чечевичный суп стал благодаря драматической библейской истории про обмен права первородства на миску чечевичной похлебки, что повлияло на судьбу целого народа.';
}