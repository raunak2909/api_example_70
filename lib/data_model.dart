class DataModel{
  int limit;
  int total;
  int skip;
  List<QuoteModel> quotes;

  DataModel({
    required this.quotes,
    required this.skip,
    required this.limit,
    required this.total});

  factory DataModel.fromJson(Map<String, dynamic> json){
    List<QuoteModel> mQuotes = [];

    for(Map<String, dynamic> eachQuote in json['quotes']){
      var eachModel = QuoteModel.fromJson(eachQuote);
      mQuotes.add(eachModel);
    }


    return DataModel(
        quotes: mQuotes,
        skip: json['skip'],
        limit: json['limit'],
        total: json['total']);
  }


}

class QuoteModel {
  int id;
  String author;
  String quote;

  QuoteModel({
    required this.id,
    required this.author,
    required this.quote});

  factory QuoteModel.fromJson(Map<String, dynamic> json){
    return QuoteModel(
        id: json['id'],
        author: json['author'],
        quote: json['quote']);
  }
}
