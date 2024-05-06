import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/views/api_model.dart';

class Homecontroller with ChangeNotifier{

List<String> categories = [
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'sports',
  'technology'
];

  NewApiRestModel? resModel;
  bool isLoading = false;

  Future getdata()async{

isLoading = true;
notifyListeners();
Uri url = Uri.parse('https://newsapi.org/v2/everything?q=football&apiKey=4182f41d4ffe4d1b903a4ae21f7fa2e6');

var res = await http.get(url);

if(res.statusCode == 200){
var decodedate = jsonDecode(res.body);
resModel = NewApiRestModel.fromJson(decodedate);
notifyListeners();
print('ff');

}
else{
  
print('u r failed');
  
}
isLoading = false;
notifyListeners();


}

}