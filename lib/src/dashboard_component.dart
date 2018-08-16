import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

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
  ],
  exports: [RoutePaths, Routes],
)

class DashboardComponent implements OnInit {
  // list of new generation heroes
  List<NextGenHero> nextGenHeroesList;
  // list of top heroes
  List<NextGenHero> topHeroesList;

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
  void onSelect(NextGenHero hero) {
    this._router.navigate(RoutePaths.hero.toUrl(parameters: {idParam: hero.heroId}));
  }

  // prepare hero data to display
  void _prepareHeroesData() async {
    print("Prepare heroes data for dashboard...");
    nextGenHeroesList = await this._heroDataService.getAllHeroes();
    topHeroesList = nextGenHeroesList.skip(1).take(4).toList();
  }

  // display all heroes
  void displayAllHeroes() {
    this._router.navigate(RoutePaths.classifiedHeroes.toUrl());
  }

  // add new hero
  void addNewHero() {
    this._router.navigate(RoutePaths.addHero.toUrl());
  }
}

