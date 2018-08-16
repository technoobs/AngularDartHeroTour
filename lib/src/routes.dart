import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import './hero_tour/hero_tour_list/hero_tour_list_component.template.dart' as hero_tour_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
import './hero_tour/hero_component/hero_component.template.dart' as hero_template;
import './hero_tour/hero_edit/hero_edit_component.template.dart' as hero_edit_template;

export 'route_paths.dart';

class Routes {

  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_template.HeroComponentNgFactory,
  );

  static final classifiedHeroes = RouteDefinition(
    routePath: RoutePaths.classifiedHeroes,
    component: hero_tour_list_template.HeroTourListComponentNgFactory,
  );

  static final mixedHeroes = RouteDefinition(
    routePath: RoutePaths.mixedHeroes,
    component: hero_tour_list_template.HeroTourListComponentNgFactory,
  );

  static final addHero = RouteDefinition(
    routePath: RoutePaths.addHero,
    component: hero_edit_template.HeroEditComponentNgFactory
  );

  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
    dashboard,
    classifiedHeroes,
    mixedHeroes,
    hero,
    addHero
  ];
}