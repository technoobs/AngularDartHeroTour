import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import '../../hero.dart';

import '../hero_service/hero_service.dart';
import '../../route_paths.dart';

@Component(
  selector: 'my-hero',
  styleUrls: ['hero_component.css'],
  templateUrl: 'hero_component.html',
  directives: [coreDirectives, formDirectives],
)
class HeroComponent implements OnActivate {
  // @Input()
  Hero hero;

  final HeroService _heroService;
  final Location _location;

  HeroComponent(this._heroService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }

  // get hero id
  int getId(Map<String, String> parameters) {
    final id = parameters[idParam];
    window.console.log(id);
    return id == null ? null : int.tryParse(id);
  }

  // go back
  void goBack() => _location.back();

}
