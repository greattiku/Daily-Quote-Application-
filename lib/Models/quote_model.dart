class QuoteModel {
  String text;
  String author;

  QuoteModel({
   required this.text,
   required this.author,
  });

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is QuoteModel &&
  //         runtimeType == other.runtimeType &&
  //         text == other.text &&
  //         author == other.author;

  // @override
  // int get hashCode => text.hashCode ^ author.hashCode;

}