import 'package:daily_qoutes_app/Controller/home_controller.dart';
import 'package:daily_qoutes_app/Screens/favorite_screen.dart';
import 'package:daily_qoutes_app/Screens/quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
  var controller = Get.find<HomeController>();
class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> pages = [
    QuoteScreen(),
    FavoriteQuoteScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> 
      pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(()=>
         Container(
          height: 80,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
           child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
             child: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 156, 186, 239),
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.changePageIndex(index);
              },
              selectedItemColor: Colors.blueAccent,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.format_quote_outlined),
                label: 'Quotes',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border),
                label: 'Favorite'),
              ]),
           ),
         ),
      ),
    );
  }
}