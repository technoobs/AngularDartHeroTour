import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import './hero_component/hero_component.dart';
import './hero_service/hero_service.dart';
import '../hero.dart';
import '../mock_heroes.dart';

@Component(
  selector: 'app-hero-tour',
  styleUrls: ['hero_tour_component.css'],
  templateUrl: 'hero_tour_component.html',
  directives: [
    coreDirectives, 
    formDirectives,
    HeroComponent                                                                           
  ],
  providers: [ClassProvider(HeroService)],

)
class HeroTourComponent implements OnInit {

  // inject service
  final HeroService _heroService;
  HeroTourComponent(this._heroService);


  final title = "Tour of Heroes";
  // Hero hero = Hero(1, "Windstorm");

  Hero selectedHero;
  // List<Hero> heroList = mockHeroes;
  List<Hero> heroList;

  void ngOnInit() {
    // fetch all heroes information
    _getAllHeroes();
  }

  // clikc and show hero details
  onSelect(Hero hero) {
    print("Selected hero is: $hero");
    selectedHero = hero;
  }

  void _getAllHeroes() {
    _heroService.getAllHeroes().then(
      (heroes) {
        // print("get heroes data");
        // print("$heroes");
        window.console.info("Get heroes data");
        window.console.info(heroes);
        this.heroList = heroes;
      }
    );
  }
}