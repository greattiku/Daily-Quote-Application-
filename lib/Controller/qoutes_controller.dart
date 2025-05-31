 import 'package:daily_qoutes_app/Utils/shared_pref_utils.dart';
import 'package:daily_qoutes_app/Models/quote_model.dart';
import 'package:get/get.dart';

class QuoteController extends GetxController{
  var dailyQuote = QuoteModel(text: '', author: '').obs;
  var favoriteQuotes = <QuoteModel>[].obs;
  var quotes = [
    //QuoteModel(text: 'Believe you can and you\'re halfway there.', author: 'Theodore Roosevelt'),
    QuoteModel(text: 'It does not matter how slowly you go\n as long as you do not stop.', author: 'Confucius'),
    QuoteModel(text: 'Success is not final, failure is not fatal:\n It is the courage to continue that counts.', author: 'Winston Churchill'),
    QuoteModel(text: 'You miss 100% of the shots you don\'t take.', author: 'Wayne Gretzky'),
    QuoteModel(text: 'Don\'t watch the clock; do what it does.\n Keep going.', author: 'Sam Levenson'),
  ].obs;



  void getDailyQuote() async {
    final lastQuoteDate = await SharedPrefUtils.getLastQuoteDate();
    final currentDate = DateTime.now();
    if (lastQuoteDate == null ) {
      dailyQuote.value = quotes[DateTime.now().day % quotes.length];
      await SharedPrefUtils.saveLastQuoteDate(currentDate);
      await SharedPrefUtils.saveDailyQuote(dailyQuote.value);
    } else {
      dailyQuote.value = await SharedPrefUtils.getDailyQuote();
    }
  }

  void toggleFavorite(QuoteModel quote) async {
    if (favoriteQuotes.contains(quote)) {
      favoriteQuotes.remove(quote);
      //Where((element)=> element.text == quote.text && element.author== quote.author);
    } else {
      favoriteQuotes.add(quote);
    }
    await SharedPrefUtils.saveFavoriteQuotes(favoriteQuotes);
  }

  void getFavoriteQuotes() async {
    favoriteQuotes.value = await SharedPrefUtils.getFavoriteQuotes();
 }

  Future<List<QuoteModel>> getAllQuotes() async {
    return await SharedPrefUtils.getAllQuotes();
  }

  void addQuote(QuoteModel quote) {
    quotes.add(quote);
    SharedPrefUtils.saveAllQuotes(quotes);
  }


 }