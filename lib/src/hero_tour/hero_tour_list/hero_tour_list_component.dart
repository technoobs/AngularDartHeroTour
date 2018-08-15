import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../hero_component/hero_component.dart';
import '../../support/server_calls/hero_data_service.dart';
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
class HeroTourListComponent implements OnInit, OnActivate {

  // display mode: classified, mixed.
  String displayMode;

  final Router _router;
  final Location _location;
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

  HeroTourListComponent(this._heroDataService, this._router, this._location);

  @override
  void onActivate(_, RouterState current) async {
    this.displayMode = current.toUrl().split("/")[2];
  }

  void ngOnInit() {
    this._getAllHeroes();
  }

  // clikc and show hero details
  onSelect(NextGenHero hero) {
    print("Selected hero is: $hero");
    // selectedHero = hero;
    print(hero.heroId);
    // this._router.navigate(path);
  }

  // get all heroes from server
  Future < void > _getAllHeroes() async {
    this.heroList = await _heroDataService.getAllHeroes();
    // if have heroes, populate
    if (displayMode == "classified") {
      if (this.heroList.length != 0) {
        this._populateAbilityHeroes(heroList);
      } else {
        print("Empty heroList...");
        this.fireHeroes = [];
        this.waterHeroes = [];
        this.groundHeroes = [];
        this.windHeroes = [];
        this.thunderHeroes = [];
      }
    }
  }

  // populate hero list according to ability type
  _populateAbilityHeroes(List < NextGenHero > heroList) {
    if (heroList.length != 0) {
      for (var hero in heroList) {
        switch (hero.abilityType.toUpperCase()) {
          case "FIRE":
            this.fireHeroes.add(hero);
            break;
          case "WATER":
            this.waterHeroes.add(hero);
            break;
          case "GROUND":
            this.groundHeroes.add(hero);
            break;
          case "WIND":
            this.windHeroes.add(hero);
            break;
          case "THUNDER":
            this.thunderHeroes.add(hero);
            break;
        }
      }
    }
  }

  // delete hero
  Future < void > deleteSelectedHero(NextGenHero hero) async {
    assert(hero.heroId.toString() != "");
    final result = await this._heroDataService.deleteHero(hero.heroId);
    if(result == "success") {
      print("Start to retrieve new heroes list");
      this._getAllHeroes();
    } else {
      print("Delete Failed...");
    }
  }

  // delete all heroes
  Future < void > deleteAllHeroes() async {
    print("Delete All Heroes");
    
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