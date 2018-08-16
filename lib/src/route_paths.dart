import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final mixedHeroes = RoutePath(path: 'heroes/view/mixed');
  static final classifiedHeroes = RoutePath(path: 'heroes/view/classified');
  static final dashboard = RoutePath(path: 'dashboard');

  // url for one single hero
  static final hero = RoutePath(path: 'heroes/info/:$idParam');
  // url for adding new hero
  static final addHero = RoutePath(path: 'heroes/add');
}

int getId(Map<String, String> parameters) {
    final id = parameters[idParam];
    return id == null ? null : int.tryParse(id);
}