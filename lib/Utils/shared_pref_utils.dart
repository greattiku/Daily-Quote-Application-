import 'package:daily_qoutes_app/Models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefUtils {
   static const String DAILY_QUOTE_TEXT_KEY = 'daily_quote_text';
  static const String DAILY_QUOTE_AUTHOR_KEY = 'daily_quote_author';
  static const String FAVORITE_QUOTES_KEY = 'favorite_quotes';
  static const String LAST_QUOTE_DATE_KEY = 'last_quote_date';

  static Future<void> saveDailyQuote(QuoteModel quote) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(DAILY_QUOTE_TEXT_KEY, quote.text);
    prefs.setString(DAILY_QUOTE_AUTHOR_KEY, quote.author);
  }

  static Future<QuoteModel> getDailyQuote() async {
    final prefs = await SharedPreferences.getInstance();
    final text = prefs.getString(DAILY_QUOTE_TEXT_KEY) ?? '';
    final author = prefs.getString(DAILY_QUOTE_AUTHOR_KEY) ?? '';
    return QuoteModel(text: text, author: author);
  }

  static Future<void> saveFavoriteQuotes(List<QuoteModel> quotes) async {
    final prefs = await SharedPreferences.getInstance();
    final quotesJson = quotes.map((quote) => '${quote.text}|${quote.author}').toList();
    prefs.setStringList(FAVORITE_QUOTES_KEY,quotesJson);
}

    static Future<List<QuoteModel>> getFavoriteQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    final quotesJson = prefs.getStringList(FAVORITE_QUOTES_KEY) ?? [];
    return quotesJson.map((quote) {
      final parts = quote.split('|');
      return QuoteModel(text: parts[0], author: parts[1]);
    }).toList();
  }


  static Future<void> saveLastQuoteDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(LAST_QUOTE_DATE_KEY, date.toIso8601String());
  }

  static Future<DateTime?> getLastQuoteDate() async {
    final prefs = await SharedPreferences.getInstance();
    final dateString = prefs.getString(LAST_QUOTE_DATE_KEY);
    if (dateString != null) {
      return DateTime.parse(dateString);
    } else {
      return null;
      }
 }

    static Future<void> saveAllQuotes(List<QuoteModel> quotes) async {
    final prefs = await SharedPreferences.getInstance();
    final quotesJson = quotes.map((quote) => '${quote.text}|${quote.author}').toList();
    prefs.setStringList('all_quotes', quotesJson);
  }

  static Future<List<QuoteModel>> getAllQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    final quotesJson = prefs.getStringList('all_quotes') ?? [];
    return quotesJson.map((quote) {
      final parts = quote.split('|');
      return QuoteModel(text: parts[0], author: parts[1]);
    }).toList();
    }


}