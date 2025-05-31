import 'package:daily_qoutes_app/Controller/qoutes_controller.dart';
import 'package:daily_qoutes_app/Screens/favorite_screen.dart';
import 'package:daily_qoutes_app/Models/quote_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}
 var controller = Get.find<QuoteController>();
class _QuoteScreenState extends State<QuoteScreen> {
    @override
  void initState() {
    super.initState();
    controller.getDailyQuote();
    controller.getFavoriteQuotes();
    controller.getAllQuotes();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Be Amazing',
          style: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(onPressed: (){
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoriteQuoteScreen()));
            Get.to(FavoriteQuoteScreen());
            }, 
            icon: Icon(Icons.favorite)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.notification_add_outlined),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.blueAccent,spreadRadius: 4,
                      blurRadius: 3
                      )
                    ],
                    color: Colors.white
                  ),
                  child: Obx(()=>
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('"${controller.dailyQuote.value.text}"',
                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text('-${controller.dailyQuote.value.author}'),
                       ],
                     ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(()=>
                       Checkbox(
                       // fillColor: Colors.blueAccent,
                        value: controller.favoriteQuotes.contains(controller.dailyQuote.value) , 
                        onChanged: (value)=> controller.toggleFavorite(controller.dailyQuote.value),),
                    ),
                    Text('Click to add to Favourite'),
                  ],
                ),
              ],
            ),
          ),
        ),
    ));
  }
}