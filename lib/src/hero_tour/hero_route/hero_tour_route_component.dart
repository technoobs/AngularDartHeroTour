import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../hero_service/hero_service.dart';
import '../hero_tour_list/hero_tour_list_component.dart';

import '../../routes.dart';

@Component(
  selector: 'hero-tour-app',
  styleUrls: ['hero_tour_route_component.css'],
  templateUrl: 'hero_tour_route_component.html',
  directives: [
    routerDirectives,
    HeroTourListComponent
  ],
  providers: [ClassProvider(HeroService)],
  exports: [RoutePaths, Routes],
)
class HeroTourApp {
  final title = 'Tour of Heroes';
}
