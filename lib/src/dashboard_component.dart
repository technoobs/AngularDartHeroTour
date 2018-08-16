import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import './hero_tour/hero_tour_list/hero_tour_list_component.dart';
import './hero_tour/hero_edit/hero_edit_component.dart';
import './support/data_model/next_generate_hero.dart';
import './support/server_calls/hero_data_service.dart';

import 'routes.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [
    coreDirectives, 
    routerDirectives,
    formDirectives,
    // HeroEditComponent,
    // HeroTourListComponent,
  ],
  exports: [RoutePaths, Routes],
)

class DashboardComponent implements OnInit {
  // list of new generation heroes
  List<NextGenHero> nextGenHeroesList;
  // list of top heroes
  List<NextGenHero> topHeroesList;
  // new generation hero
  // NextGenHero nextGenHero;

  // routing url for one single hero
  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  // status for single hero data
  bool displayAll = false;
  // status to control add form
  bool displayAddForm = false;

  final Router _router;
  final HeroDataService _heroDataService;

  DashboardComponent(
    this._router,
    this._heroDataService,
    );

  @override
  void ngOnInit() async {
    this._prepareHeroesData();
  }

  // clikc and show hero details
  onSelect(NextGenHero hero) {
    this._router.navigate(RoutePaths.hero.toUrl(parameters: {idParam: hero.heroId}));
  }

  // prepare hero data to display
  _prepareHeroesData() async {
    print("Prepare heroes data for dashboard...");
    nextGenHeroesList = await this._heroDataService.getAllHeroes();
    topHeroesList = nextGenHeroesList.skip(1).take(4).toList();
  }

  // display all heroes
  displayAllHeroes() {
    this._router.navigate(RoutePaths.classifiedHeroes.toUrl());
  }

  // add new hero
  addNewHero() {
    this._router.navigate(RoutePaths.addHero.toUrl());
  }

  // String _heroDisplayUrl(String mode) => RoutePaths.heroes.toUrl(parameters: {
  //   displayMode: '$mode'
  // });

}

