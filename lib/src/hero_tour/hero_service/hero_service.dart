import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

import '../../support/data_model/hero.dart';


class HeroService {
  static const _heroesUrl = 'api/heroes'; // URL to web API

  final Client _http;

  HeroService(this._http);

  // get all heroes
  Future < List < Hero >> getAllHeroes() async {
    try {
      print("Hero service get all heroes....");

      final response = await _http.get(_heroesUrl);
      final heroes = (_extractData(response) as List)
        .map((json) => Hero.fromJson(json))
        .toList();
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // get details of one single hero
  Future < Hero > get(int id) async {
    try {
      final response = await _http.get('$_heroesUrl/$id');
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  // header that used for http request
  static final _headers = {
    'Content-Type': 'application/json'
  };
  // ···
  // update hero for the view only
  Future < Hero > update(Hero hero) async {
    try {
      final url = '$_heroesUrl/${hero.id}';
      final response =
        await _http.put(url, headers: _headers, body: json.encode(hero));
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  // create new hero
  Future < Hero > create(String name) async {
    try {
      final response = await _http.post(_heroesUrl,
        headers: _headers, body: json.encode({
          'name': name
        }));
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  // delete hero
  Future < void > delete(int id) async {
    try {
      final url = '$_heroesUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }


}