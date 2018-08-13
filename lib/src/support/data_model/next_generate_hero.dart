
// next generation hero class
class NextGenHero {

  // hero unique id
  final String heroId;
  // hero name
  String heroName;
  // hero ability, need to split by comma if multiple abilities appear
  String heroAbility;

  NextGenHero(this.heroId, this.heroName, this.heroAbility);

  // assign value to class properties
  factory NextGenHero.fromJson(Map<String, dynamic> nextGenHero) =>
    NextGenHero(nextGenHero['heroId'].toString(), nextGenHero['heroName'], nextGenHero['heroAbilty']);
  
  Map toJson() => { "heroName": heroName, "heroAbilty": heroAbility };
}