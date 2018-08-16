
// next generation hero class
class NextGenHero {

  // hero unique id
  final String heroId;
  // hero name
  String heroName;
  // ability type
  String abilityType;
  // hero ability, need to split by comma if multiple abilities appear
  String heroAbility;

  NextGenHero(this.heroId, this.heroName, this.abilityType, this.heroAbility);

  // assign value to class properties
  factory NextGenHero.fromJson(Map<String, dynamic> nextGenHero) =>
    NextGenHero(
      nextGenHero['heroId'].toString(), 
      nextGenHero['heroName'],
      nextGenHero['abilityType'],
      nextGenHero['heroAbilty']
      );
  
  Map toJson() => {
    "heroId": heroId,
    "heroName": heroName,
    "abilityType": abilityType,
    "heroAbilty": heroAbility 
    };
}

// new hero class for adding
class NewHeroToAdd {
  // hero name
  String heroName;
  // ability type
  String abilityType;
  // hero ability, need to split by comma if multiple abilities appear
  String heroAbility;

  NewHeroToAdd(this.heroName, this.abilityType, this.heroAbility);

  Map toJson() => {
    "name": heroName,
    "abilityType": abilityType,
    "ability": heroAbility 
    };
}