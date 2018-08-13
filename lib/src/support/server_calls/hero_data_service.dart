
// api service for hero tour data

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

import '../data_model/response_data.dart';
import '../data_model/next_generate_hero.dart';

class HeroDataService {

  // base URL for api
  static const _baseUrl = "http://tecnooob.com/dartserver/";

  final Client _http;

  HeroDataService(this._http);

  // get all heroes data
  Future getAllHeroes() async {
    try {
      window.console.log("Starting to get all heroes data.....");
      final response = await _http.get(_baseUrl + "heroes/get");

      window.console.log("All heroes data is: ");
      dynamic responseData = _extractData(response);
      final heroCollection = (responseData as List).map(
        (value) => NextGenHero.fromJson(value)
      ).toList();

      window.console.log(heroCollection);
      
      return heroCollection;
    } catch(e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  dynamic _extractData(Response resp) {
    print("Extracting data from server response....");
    return json.decode(resp.body)['data'];
  }

}