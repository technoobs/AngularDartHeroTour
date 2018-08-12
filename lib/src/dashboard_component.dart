import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import './hero_tour/hero_search/hero_search_component.dart';
import 'hero.dart';
import './hero_tour/hero_service/hero_service.dart';
import './support/data_model/next_generate_hero.dart';
import './support/server_calls/hero_data_service.dart';
import 'route_paths.dart';

import 'dart:html';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [coreDirectives, routerDirectives, HeroSearchComponent],
)

class DashboardComponent implements OnInit {
  List<Hero> heroes;

  // list of new generation heroes
  List<NextGenHero> nextGenHeroes;

  // url for one single hero
  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  // final HeroService _heroService;

  final HeroDataService _heroDataService;

  DashboardComponent(
    // this._heroService,
    this._heroDataService,
    );

  @override
  void ngOnInit() async {
    // heroes = (await _heroService.getAllHeroes()).skip(1).take(4).toList();

    window.console.log("Dashboard fetching data");
    nextGenHeroes = await this._heroDataService.getAllHeroes();
  }
}

