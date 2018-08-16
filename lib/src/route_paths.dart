import 'package:angular_router/angular_router.dart';

const idParam = 'id';
// display mode for all heroes
// const displayMode = 'mode';

class RoutePaths {
  static final mixedHeroes = RoutePath(path: 'heroes/view/mixed');
  static final classifiedHeroes = RoutePath(path: 'heroes/view/classified');
  static final dashboard = RoutePath(path: 'dashboard');

  // url for one single hero
  // static final hero = RoutePath(path: '${heroes.path}/:$idParam');
  static final hero = RoutePath(path: 'heroes/info/:$idParam');
  // url for adding new hero
  static final addHero = RoutePath(path: 'heroes/add');
}

int getId(Map<String, String> parameters) {
    final id = parameters[idParam];
    return id == null ? null : int.tryParse(id);
}

// String getDisplayMode(Map<String, String> parameters) {
//   final mode = parameters[displayMode];
//   return mode == null ? null : mode;
// }