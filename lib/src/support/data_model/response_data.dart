
import './next_generate_hero.dart';

// data model of server response data
class HeroResponse {
  // response success or failure
  String info;
  // hero data, can be one object or a list
  dynamic data;

  HeroResponse(String info, dynamic data);
}

// data model of single hero response data
class SingleHeroResponse {
  NextGenHero data;

  SingleHeroResponse(NextGenHero data) {
    print("Single hero response...");
    print("$data");
  }
}