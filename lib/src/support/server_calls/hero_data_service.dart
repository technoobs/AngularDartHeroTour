// api service for hero tour data

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

import '../data_model/response_data.dart';
import '../data_model/next_generate_hero.dart';

class HeroDataService {

  // base URL for api
  static
  const _baseUrl = "http://tecnooob.com/dartserver/";
  // default header for post request
  static final _headers = {
    'Content-Type': 'application/json'
  };

  final Client _http;

  HeroDataService(this._http);

  // get all heroes data
  Future <List<NextGenHero>> getAllHeroes() async {
    try {
      print("Starting to get all heroes data.....");
      final response = await _http.get(_baseUrl + "heroes/get");

      print("All heroes data is: ");
      dynamic responseData = _extractData(response);
      final heroCollection = (responseData as List).map(
        (value) => NextGenHero.fromJson(value)
      ).toList();

      return heroCollection;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // get information about one hero according to hero id
  Future <NextGenHero> getHeroDetails(String heroId) async {
    try {
      print("Starting to get data about one hero...");
      assert(heroId is String);
      assert(heroId != "");

      final response = await _http.get(_baseUrl + "heroes/get/" + heroId);
      dynamic responseData = _extractData(response);
      final heroDetail = (responseData as Object);

      return heroDetail;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // submit hero data to backend server
  Future <NextGenHero> submitNewHero(NextGenHero newHero) async {
    try {
      print("Service calling....");
      print(newHero);
      assert(newHero.heroName != null);

      final response = await _http.post(
        _baseUrl + "heroes/add", headers: _headers, body: json.encode(newHero));
      dynamic responseData = _extractData(response);
      final newHeroDetail = (responseData as Object);

      return newHeroDetail;
    } catch (e) {
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