import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import './hero_component/hero_component.dart';
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
)

class HeroTourComponent {
  final title = "Tour of Heroes";
  // Hero hero = Hero(1, "Windstorm");

  Hero selectedHero;
  List<Hero> heroList = mockHeroes;

  // clikc and show hero details
  onSelect(Hero hero) {
    print("Selected hero is: $hero");
    selectedHero = hero;
  }
}