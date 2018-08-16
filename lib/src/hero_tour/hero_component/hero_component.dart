import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../../support/data_model/next_generate_hero.dart';
import '../../support/server_calls/hero_data_service.dart';
import '../../route_paths.dart';

@Component(
  selector: 'my-hero',
  styleUrls: ['hero_component.css'],
  templateUrl: 'hero_component.html',
  directives: [coreDirectives, formDirectives],
  providers: [ClassProvider(HeroDataService)],
)
class HeroComponent implements OnActivate {

  final HeroDataService _heroDataService;
  final Location _location;

  NextGenHero hero;

  HeroComponent(this._heroDataService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroDataService.getHeroDetails(id.toString()));
  }

  // go back
  void goBack() => _location.back();
}
