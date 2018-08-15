import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../hero_service/hero_service.dart';
import '../hero_tour_list/hero_tour_list_component.dart';
import '../../support/server_calls/hero_data_service.dart';

import '../../routes.dart';

@Component(
  selector: 'hero-tour-app',
  styleUrls: ['hero_tour_route_component.css'],
  templateUrl: 'hero_tour_route_component.html',
  directives: [
    routerDirectives,
    HeroTourListComponent
  ],
  providers: [
    ClassProvider(HeroService),
    ClassProvider(HeroDataService),
  ],
  exports: [RoutePaths, Routes],
)
class HeroTourApp {
  // router for route navigation
  final Router _router;
  final title = 'Tour of Heroes';

  HeroTourApp(this._router);

  // function that navigate to dashboard
  goToDashboard() {
    _router.navigate(RoutePaths.dashboard.toUrl());
  }

  // function that navigate to mixed displayed heroes
  goToMixedHeroes() {
    _router.navigate(RoutePaths.mixedHeroes.toUrl());
  }
}
