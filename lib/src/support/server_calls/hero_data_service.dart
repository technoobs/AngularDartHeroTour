
// api service for hero tour data

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

class HeroDataService {

  static const _baseUrl = "http://tecnooob.com/dartserver/";

  final Client _http;

  HeroDataService(this._http);

  // get all heroes data
  Future <List<Hero>> getAllHeroes() async {
    try {
      window.console.log("Starting to get all heroes data.....");
      final response = await _http.get(_baseUrl + "heroes/get");
      final responseData = 
    } catch(e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

}