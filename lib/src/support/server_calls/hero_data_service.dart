// api service for hero tour data

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

import '../data_model/next_generate_hero.dart';

class HeroDataService {

  // base URL for api
  static const _baseUrl = "http://tecnooob.com/dartserver/";

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
      final response = await this._http.get(_baseUrl + "heroes/get");

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

      final response = await this._http.get(_baseUrl + "heroes/get/" + heroId);
      dynamic responseData = _extractData(response);
      final heroDetail = NextGenHero.fromJson((responseData as Object));

      return heroDetail;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // submit hero data to backend server
  Future <NextGenHero> submitNewHero(dynamic newHero) async {
    try {
      assert(newHero['name'] != "");
      assert(newHero['abilityType'] != "");
      assert(newHero['ability'] != "");

      final response = await this._http.post(
        _baseUrl + "heroes/add", headers: _headers, body: json.encode(newHero));
      print(response);
      dynamic responseData = _extractData(response);
      final newHeroDetail = NextGenHero.fromJson((responseData as Object));

      assert(newHeroDetail.heroId.toString() != "");
      
      return newHeroDetail;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // get all heroes that belong to the same ability type
  Future <List<NextGenHero>> searchAllTypeHeroes(String abilityType) async {
    try {
      assert(abilityType != "");
      final response = await this._http.get(_baseUrl + "heroes/" + abilityType + "/get");
      dynamic responseData = _extractData(response);
      final heroCollection = (responseData as List).map(
        (value) => NextGenHero.fromJson(value)
      ).toList();

      return heroCollection;
    } catch(e) {
      throw _handleError(e);
    }
  }

  // delete hero by providing hero id
  Future <String> deleteHero(String heroId) async {
    try {
      assert(heroId != "");
      final response = await this._http.get(_baseUrl + "heroes/delete/" + heroId);
      dynamic responseData = _extractInfo(response);
      final responseInfo = responseData as String;
      
      return responseInfo;
    } catch(e) {
      throw _handleError(e);
    }
  }

  // delete all heroes
  Future <void> deleteAllHeroes() async {
    try {
      final response = await this._http.get(_baseUrl + "heroes/deleteall");
      dynamic responseData = _extractData(response);
      
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

  dynamic _extractInfo(Response resp) {
    print("Extracting info from server response....");
    return json.decode(resp.body)['info'];
  }

}