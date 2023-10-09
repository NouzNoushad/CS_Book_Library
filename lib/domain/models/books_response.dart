import 'dart:convert';

BooksResponseModel booksResponseModelFromJson(String str) =>
    BooksResponseModel.fromJson(json.decode(str));

String booksResponseModelToJson(BooksResponseModel data) =>
    json.encode(data.toJson());

class BooksResponseModel {
  String? _error;
  String? _total;
  List<Books>? _books;

  BooksResponseModel({String? error, String? total, List<Books>? books}) {
    if (error != null) {
      _error = error;
    }
    if (total != null) {
      _total = total;
    }
    if (books != null) {
      _books = books;
    }
  }

  String? get error => _error;
  set error(String? error) => _error = error;
  String? get total => _total;
  set total(String? total) => _total = total;
  List<Books>? get books => _books;
  set books(List<Books>? books) => _books = books;

  BooksResponseModel.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    _total = json['total'];
    if (json['books'] != null) {
      _books = <Books>[];
      json['books'].forEach((v) {
        _books!.add(Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = _error;
    data['total'] = _total;
    if (_books != null) {
      data['books'] = _books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  String? _title;
  String? _subtitle;
  String? _isbn13;
  String? _price;
  String? _image;
  String? _url;

  Books(
      {String? title,
      String? subtitle,
      String? isbn13,
      String? price,
      String? image,
      String? url}) {
    if (title != null) {
      _title = title;
    }
    if (subtitle != null) {
      _subtitle = subtitle;
    }
    if (isbn13 != null) {
      _isbn13 = isbn13;
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
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get subtitle => _subtitle;
  set subtitle(String? subtitle) => _subtitle = subtitle;
  String? get isbn13 => _isbn13;
  set isbn13(String? isbn13) => _isbn13 = isbn13;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get url => _url;
  set url(String? url) => _url = url;

  Books.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _subtitle = json['subtitle'];
    _isbn13 = json['isbn13'];
    _price = json['price'];
    _image = json['image'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = _title;
    data['subtitle'] = _subtitle;
    data['isbn13'] = _isbn13;
    data['price'] = _price;
    data['image'] = _image;
    data['url'] = _url;
    return data;
  }
}
