import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import './hero_tour/hero_tour_list/hero_tour_list_component.template.dart' as hero_tour_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
import './hero_tour/hero_component/hero_component.template.dart' as hero_template;

export 'route_paths.dart';

class Routes {

  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_template.HeroComponentNgFactory,
  );

  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_tour_list_template.HeroTourListComponentNgFactory,
    // component: hero_list_template.HeroListComponentNgFactory,
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
    heroes,
    hero,
    dashboard,
  ];
}
