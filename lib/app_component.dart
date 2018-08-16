import 'package:angular/angular.dart';
import 'src/hero_tour/hero_route/hero_tour_route_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    coreDirectives, 
    HeroTourApp,
  ],
)
class AppComponent {
  
}
