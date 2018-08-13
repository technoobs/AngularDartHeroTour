import 'package:angular/angular.dart';

import 'src/hero_tour/hero_route/hero_tour_route_component.dart';

import 'src/routes.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    coreDirectives, 
    HeroTourApp,
    // HeroTourListComponent
  ],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.

  // default value to control view display
  bool show_hero_view = false;
  bool show_todo_view = true;

  // display Hero component
  void changeViewToHero() {
    this.show_todo_view = false;
    this.show_hero_view = true;
  }

  // display Todo component
  void changeViewToTodo() {
    this.show_hero_view = false;
    this.show_todo_view = true;
  }
}
