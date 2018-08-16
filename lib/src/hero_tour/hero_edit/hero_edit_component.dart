import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../../support/data_model/next_generate_hero.dart';
import '../../support/server_calls/hero_data_service.dart';
import '../../route_paths.dart';
import '../../routes.dart';

@Component(
  selector: 'app-hero-edit',
  templateUrl: 'hero_edit_component.html',
  styleUrls: ['hero_edit_component.css'],
  directives: [
    coreDirectives,
    formDirectives
  ],
)

class HeroEditComponent implements OnInit {

  final Router _router;
  final Location _location;
  // hero data service
  final HeroDataService _heroDataService;
  // hero data for editing
  NextGenHero nextGenHero;
  // new added hero
  NewHeroToAdd newHero = new NewHeroToAdd("", "", "");

  // predefined hero ability
  String predefinedAbility;

  HeroEditComponent(
    this._heroDataService,
    this._router,
    this._location
  );

  @override
  void ngOnInit() {}

  // submit hero data
  submitHero() async {

    if (this.newHero.heroName.trim() == "") {
      querySelector("#name-error")..style.display = "block";
      querySelector("#type-error")..style.display = "none";
      querySelector("#ability-error")..style.display = "none";
    } else if (this.newHero.heroAbility == "") {
      querySelector("#name-error")..style.display = "none";
      querySelector("#ability-error")..style.display = "none";
      querySelector("#type-error")..style.display = "block";
    } else if (this.newHero.heroAbility.trim() == "") {
      querySelector("#name-error")..style.display = "none";
      querySelector("#type-error")..style.display = "none";
      querySelector("#ability-error")..style.display = "block";
    } else {
      querySelector("#name-error")..style.display = "none";
      querySelector("#type-error")..style.display = "none";
      querySelector("#ability-error")..style.display = "none";
      final newHeroDetail = await this._heroDataService.submitNewHero(newHero.toJson());

      if (newHeroDetail.heroId.toString() != "") {
        window.alert("New Hero is added!");
        this._router.navigate(RoutePaths.hero.toUrl(parameters: {
          idParam: newHeroDetail.heroId
        }));
      }
    }
  }

  // go back
  void goBack() => _location.back();
}