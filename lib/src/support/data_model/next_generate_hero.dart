
// next generation hero
class NextGenHero {
  final String heroId;
  String heroName;
  String heroAbility;

  NextGenHero(this.heroId, this.heroName, this.heroAbility);

  factory NextGenHero.fromJson(Map<String, dynamic> nextGenHero) =>
    NextGenHero(nextGenHero['heroId'].toString(), nextGenHero['heroName'], nextGenHero['heroAbilty']);
  
  Map toJson() => { "heroName": heroName, "heroAbilty": heroAbility };
}