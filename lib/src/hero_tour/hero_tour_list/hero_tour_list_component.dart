import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../hero_component/hero_component.dart';
import '../../support/server_calls/hero_data_service.dart';
// import '../hero_service/hero_service.dart';
import '../../route_paths.dart';

import '../../support/data_model/next_generate_hero.dart';

@Component(
  selector: 'app-hero-tour-list',
  styleUrls: ['hero_tour_list_component.css'],
  templateUrl: 'hero_tour_list_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    HeroComponent
  ],
  providers: [ClassProvider(HeroDataService)],
  pipes: [commonPipes],
)
class HeroTourListComponent implements OnInit {

  final Router _router;
  final title = "Tour of Heroes";
  // inject service
  final HeroDataService _heroDataService;

  NextGenHero selectedHero;
  List < NextGenHero > heroList;

  // hero list for all fire heroes
  List < NextGenHero > fireHeroes = [];
  // hero list for all water heroes
  List < NextGenHero > waterHeroes = [];
  // hero list for all ground heroes
  List < NextGenHero > groundHeroes = [];
  // hero list for all wind heroes
  List < NextGenHero > windHeroes = [];
  // hero list for all thunder heroes
  List < NextGenHero > thunderHeroes = [];

  HeroTourListComponent(this._heroDataService, this._router);

  void ngOnInit() {
    window.console.log("Before async function");
    // fetch all heroes information
    _getAllHeroes();
    window.console.log("After async function");
  }

  // clikc and show hero details
  onSelect(NextGenHero hero) {
    print("Selected hero is: $hero");
    selectedHero = hero;
  }

  // get all heroes from server
  Future < void > _getAllHeroes() async {
    window.console.log("Before await");
    heroList = await _heroDataService.getAllHeroes();
    window.console.log("After await");
    // if have heroes, populate
    if(heroList.length != 0) {
      _populateAbilityHeroes(heroList);
    } else {
      print("Empty heroList...");
      fireHeroes = [];
      waterHeroes = [];
      groundHeroes = [];
      windHeroes = [];
      thunderHeroes = [];
    }
  }

  // populate hero list according to ability type
  _populateAbilityHeroes(List < NextGenHero > heroList) {
    if (heroList.length != 0) {
      for (var hero in heroList) {
        switch (hero.abilityType.toUpperCase()) {
          case "FIRE":
            fireHeroes.add(hero);
            break;
          case "WATER":
            waterHeroes.add(hero);
            break;
          case "GROUND":
            groundHeroes.add(hero);
            break;
          case "WIND":
            windHeroes.add(hero);
            break;
          case "THUNDER":
            thunderHeroes.add(hero);
            break;
        }
      }
    }
  }

  String _heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {
    idParam: '$id'
  });

  // Future < NavigationResult > gotoDetail() => _router.navigate(_heroUrl(selectedHero.heroId);

  // Future < void > add(String name) async {
  //   name = name.trim();
  //   if (name.isEmpty) return null;
  //   heroList.add(await _heroService.create(name));
  //   selectedHero = null;
  // }

  // Future < void > delete(Hero hero) async {
  //   await _heroService.delete(hero.id);
  //   heroList.remove(hero);
  //   if (selectedHero == hero) selectedHero = null;
  // }


}