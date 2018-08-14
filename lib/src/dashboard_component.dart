import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import './hero_tour/hero_edit/hero_edit_component.dart';
import './hero_tour/hero_search/hero_search_component.dart';
import './support/data_model/hero.dart';
import './support/data_model/next_generate_hero.dart';
import './support/server_calls/hero_data_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [
    coreDirectives, 
    routerDirectives,
    formDirectives,
    HeroEditComponent,
    // HeroSearchComponent
  ],
)

class DashboardComponent implements OnInit {
  // list of new generation heroes
  List<NextGenHero> nextGenHeroesList;
  // list of top heroes
  List<NextGenHero> topHeroesList;
  // new generation hero
  NextGenHero nextGenHero;

  // routing url for one single hero
  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  // status for single hero data
  bool displayAll = false;
  // status to control add form
  bool displayAddForm = false;

  final HeroDataService _heroDataService;

  DashboardComponent(
    this._heroDataService,
    );

  @override
  void ngOnInit() async {
    this._prepareHeroesData();
  }

  // prepare hero data to display
  _prepareHeroesData() async {
    print("Prepare heroes data for dashboard...");
    nextGenHeroesList = await this._heroDataService.getAllHeroes();
    topHeroesList = nextGenHeroesList.skip(1).take(4).toList();
  }

  // display all heroes
  displayAllHeroes() {
    this.displayAll = true;
  }

  // add new hero
  addNewHero() {
    this.displayAddForm = true;
  }

}

