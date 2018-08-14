
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../support/data_model/next_generate_hero.dart';
import '../../support/server_calls/hero_data_service.dart';

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

  // hero data service
  final HeroDataService _heroDataService;
  // hero data for editing
  NextGenHero nextGenHero;

  HeroEditComponent(
    this._heroDataService
  );

  @override
  void ngOnInit() {

  }

  // submit hero data
  submitHero() async {
    try {
      print("Submitting new hero data");
      assert(nextGenHero != null);
      
    }
  }  


}