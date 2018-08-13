import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../hero_component/hero_component.dart';
import '../hero_service/hero_service.dart';
import '../../route_paths.dart';

import '../../support/data_model/hero.dart';

@Component(
  selector: 'app-hero-tour-list',
  styleUrls: ['hero_tour_list_component.css'],
  templateUrl: 'hero_tour_list_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    HeroComponent
  ],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)
class HeroTourListComponent implements OnInit {

  final Router _router;

  // inject service
  final HeroService _heroService;
  HeroTourListComponent(this._heroService, this._router);

  final title = "Tour of Heroes";

  Hero selectedHero;
  List < Hero > heroList;

  void ngOnInit() {
    window.console.log("Before async function");
    // fetch all heroes information
    _getAllHeroes();
    window.console.log("After async function");
  }

  // clikc and show hero details
  onSelect(Hero hero) {
    print("Selected hero is: $hero");
    selectedHero = hero;
  }

  Future < void > _getAllHeroes() async {
    window.console.log("Before await");
    heroList = await _heroService.getAllHeroes();
    window.console.log("After await");
  }

  String _heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {
    idParam: '$id'
  });

  Future < NavigationResult > gotoDetail() => _router.navigate(_heroUrl(selectedHero.id));

  Future < void > add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    heroList.add(await _heroService.create(name));
    selectedHero = null;
  }

  Future < void > delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroList.remove(hero);
    if (selectedHero == hero) selectedHero = null;
  }


}