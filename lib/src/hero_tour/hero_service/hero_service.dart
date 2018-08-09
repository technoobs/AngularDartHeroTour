
import 'dart:async';

import '../../hero.dart';
import '../../mock_heroes.dart';

class HeroService {
  Future<List<Hero>> getAllHeroes() async => mockHeroes;
  
}
