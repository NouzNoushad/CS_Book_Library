import 'dart:convert';

BookDetailsModel bookDetailsModelFromJson(String str) =>
    BookDetailsModel.fromJson(json.decode(str));

String bookDetailsModelToJson(BookDetailsModel data) =>
    json.encode(data.toJson());

class BookDetailsModel {
  String? _error;
  String? _title;
  String? _subtitle;
  String? _authors;
  String? _publisher;
  String? _language;
  String? _isbn10;
  String? _isbn13;
  String? _pages;
  String? _year;
  String? _rating;
  String? _desc;
  String? _price;
  String? _image;
  String? _url;
  Pdf? _pdf;

  BookDetailsModel(
      {String? error,
      String? title,
      String? subtitle,
      String? authors,
      String? publisher,
      String? language,
      String? isbn10,
      String? isbn13,
      String? pages,
      String? year,
      String? rating,
      String? desc,
      String? price,
      String? image,
      String? url,
      Pdf? pdf}) {
    if (error != null) {
      _error = error;
    }
    if (title != null) {
      _title = title;
    }
    if (subtitle != null) {
      _subtitle = subtitle;
    }
    if (authors != null) {
      _authors = authors;
    }
    if (publisher != null) {
      _publisher = publisher;
    }
    if (language != null) {
      _language = language;
    }
    if (isbn10 != null) {
      _isbn10 = isbn10;
    }
    if (isbn13 != null) {
      _isbn13 = isbn13;
    }
    if (pages != null) {
      _pages = pages;
    }
    if (year != null) {
      _year = year;
    }
    if (rating != null) {
      _rating = rating;
    }
    if (desc != null) {
      _desc = desc;
    }
    if (price != null) {
      _price = price;
    }
    if (image != null) {
      _image = image;
    }
    if (url != null) {
      _url = url;
    }
    if (pdf != null) {
      _pdf = pdf;
    }
  }

  String? get error => _error;
  set error(String? error) => _error = error;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get subtitle => _subtitle;
  set subtitle(String? subtitle) => _subtitle = subtitle;
  String? get authors => _authors;
  set authors(String? authors) => _authors = authors;
  String? get publisher => _publisher;
  set publisher(String? publisher) => _publisher = publisher;
  String? get language => _language;
  set language(String? language) => _language = language;
  String? get isbn10 => _isbn10;
  set isbn10(String? isbn10) => _isbn10 = isbn10;
  String? get isbn13 => _isbn13;
  set isbn13(String? isbn13) => _isbn13 = isbn13;
  String? get pages => _pages;
  set pages(String? pages) => _pages = pages;
  String? get year => _year;
  set year(String? year) => _year = year;
  String? get rating => _rating;
  set rating(String? rating) => _rating = rating;
  String? get desc => _desc;
  set desc(String? desc) => _desc = desc;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get url => _url;
  set url(String? url) => _url = url;
  Pdf? get pdf => _pdf;
  set pdf(Pdf? pdf) => _pdf = pdf;

  BookDetailsModel.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _authors = json['authors'];
    _publisher = json['publisher'];
    _language = json['language'];
    _isbn10 = json['isbn10'];
    _isbn13 = json['isbn13'];
    _pages = json['pages'];
    _year = json['year'];
    _rating = json['rating'];
    _desc = json['desc'];
    _price = json['price'];
    _image = json['image'];
    _url = json['url'];
    _pdf = json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = _error;
    data['title'] = _title;
    data['subtitle'] = _subtitle;
    data['authors'] = _authors;
    data['publisher'] = _publisher;
    data['language'] = _language;
    data['isbn10'] = _isbn10;
    data['isbn13'] = _isbn13;
    data['pages'] = _pages;
    data['year'] = _year;
    data['rating'] = _rating;
    data['desc'] = _desc;
    data['price'] = _price;
    data['image'] = _image;
    data['url'] = _url;
    if (_pdf != null) {
      data['pdf'] = _pdf!.toJson();
    }
    return data;
  }
}

class Pdf {
  String? _freeEBook;

  Pdf({String? freeEBook}) {
    if (freeEBook != null) {
      _freeEBook = freeEBook;
    }
  }

  String? get freeEBook => _freeEBook;
  set freeEBook(String? freeEBook) => _freeEBook = freeEBook;

  Pdf.fromJson(Map<String, dynamic> json) {
    _freeEBook = json['Free eBook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Free eBook'] = _freeEBook;
    return data;
  }
}
