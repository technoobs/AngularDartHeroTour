// import 'dart:async';

// import '../../hero.dart';
// import '../../mock_heroes.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

import '../../hero.dart';


class HeroService {
  // get full list of heroes
  // Future<List<Hero>> getAllHeroes() async => mockHeroes;

  // get one hero by id  
  // Future<Hero> get(int id) async =>
  //   (await getAllHeroes()).firstWhere((hero) => hero.id == id);


  static
  const _heroesUrl = 'api/heroes'; // URL to web API

  final Client _http;

  HeroService(this._http);

  Future < List < Hero >> getAllHeroes() async {
    try {

      window.console.log("Hero service get all heroes....");

      final response = await _http.get(_heroesUrl);
      final heroes = (_extractData(response) as List)
        .map((json) => Hero.fromJson(json))
        .toList();

      window.console.log("Heroes data are:");
      window.console.log(heroes);

      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

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

}