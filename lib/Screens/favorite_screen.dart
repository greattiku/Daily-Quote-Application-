
import 'package:daily_qoutes_app/Screens/quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteQuoteScreen extends StatelessWidget {
  const FavoriteQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Favourite Quotes'),
      ),
      body: Obx(()=>
      ListView.builder(
        shrinkWrap: true,
        itemCount: controller.favoriteQuotes.length,
        itemBuilder: (context,index){
          final quote = controller.favoriteQuotes[index];
          return ListTile(
            title: Text(quote.text, ),
            subtitle: Text('${quote.author}'),
            trailing: IconButton(
              onPressed: (){
                controller.toggleFavorite(quote);
              }, 
            icon: Icon(Icons.delete_forever)),
          );
        })
      ),
    );
  }
}