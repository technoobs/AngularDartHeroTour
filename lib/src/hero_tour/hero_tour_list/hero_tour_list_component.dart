import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../hero_search/hero_search_component.dart';
import '../hero_component/hero_component.dart';
import '../../support/server_calls/hero_data_service.dart';
import '../../route_paths.dart';
import '../../routes.dart';

import '../../support/data_model/next_generate_hero.dart';

@Component(
  selector: 'app-hero-tour-list',
  styleUrls: ['hero_tour_list_component.css'],
  templateUrl: 'hero_tour_list_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    HeroComponent,
    HeroSearchComponent,
  ],
  providers: [
    ClassProvider(HeroDataService),
  ],
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
  List < NextGenHero > filteredHeroList;

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

  HeroTourListComponent(
    this._heroDataService, 
    // this._heroDataTransferService,
    this._router, 
    this._location
    );

  @override
  void onActivate(_, RouterState current) async {
    this.displayMode = current.toUrl().split("/")[2];
    this._getAllHeroes();
  }

  void ngOnInit() {
    this.filteredHeroList = new List<NextGenHero>();
  }

  // clikc and show hero details
  void onSelect(NextGenHero hero) {
    this._router.navigate(RoutePaths.hero.toUrl(parameters: {
      idParam: hero.heroId
    }));
  }

  // get all heroes from server
  Future < void > _getAllHeroes() async {
    this.heroList = await _heroDataService.getAllHeroes();
    this.filteredHeroList = this.heroList;
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
  void _populateAbilityHeroes(List < NextGenHero > heroList) {
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
    var choice = window.confirm("Are you sure you want to delete this powerful hero?");
    if (choice) {
      final result = await this._heroDataService.deleteHero(hero.heroId);
      if (result == "success") {
        window.alert("Delete Successful.");
        this._getAllHeroes();
      } else {
        window.alert("Sorry, something is wrong....");
      }
    }
  }

  // delete all heroes
  Future < void > deleteAllHeroes() async {
    print("Delete All Heroes");
    this._heroDataService.deleteAllHeroes();
  }

  // add new hero
  void addNewHero() {
    this._router.navigate(RoutePaths.addHero.toUrl());
  }

  // process search option from hero-search component
  void getSearchResult(List < NextGenHero > searchResult) {
    this.filteredHeroList = searchResult;
  }
}