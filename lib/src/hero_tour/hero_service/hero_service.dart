
import 'dart:async';

import '../../hero.dart';
import '../../mock_heroes.dart';

class HeroService {
  // get full list of heroes
  Future<List<Hero>> getAllHeroes() async => mockHeroes;

  // get one hero by id  
  Future<Hero> get(int id) async =>
    (await getAllHeroes()).firstWhere((hero) => hero.id == id);

}
