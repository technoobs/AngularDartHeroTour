import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../hero.dart';

@Component(
  selector: 'app-hero-tour',
  styleUrls: ['hero_tour_component.css'],
  templateUrl: 'hero_tour_component.html',
  directives: [formDirectives],
)

class HeroTourComponent {
  final title = "Tour of Heroes";
  Hero hero = Hero(1, "Windstorm");
}