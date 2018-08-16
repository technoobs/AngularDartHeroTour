import 'dart:async';
import 'package:angular/angular.dart';
import '../../support/data_model/next_generate_hero.dart';

@Component(
  selector: 'hero-search',
  templateUrl: 'hero_search_component.html',
  styleUrls: ['hero_search_component.css'],
  directives: [coreDirectives],
  pipes: [commonPipes],
)
class HeroSearchComponent implements OnInit {

  // hero list for search filtering
  @Input() List<NextGenHero> heroesList;
  StreamController<String> _searchOptionsTerms = StreamController<String>.broadcast();
  // send search result back to parent component
  final _snedSearchOption = new StreamController<List<NextGenHero>>();
  @Output() Stream<List<NextGenHero>> get sendSearchResult => _snedSearchOption.stream;

  HeroSearchComponent() {}

  void ngOnInit() async {
    _searchOptionsTerms.stream.distinct().listen((term) {
      print("From stream");
      print(term);
      this.processSearchOption(term);
    });
  }

  // pass pressed key value back to stream
  sendSearchOption(String term) {
    print(this.heroesList);
    _searchOptionsTerms.add(term);
  }

  // function that process search options
  processSearchOption(String term) {
    List<NextGenHero> filteredResult = new List<NextGenHero>();
    for(var i in heroesList) {
      if(i.heroName.toString().toUpperCase().indexOf(term.toUpperCase()) != -1) {
        filteredResult.add(i);
      }
    }
    print("Result is:");
    filteredResult.forEach((e) => print(e.heroName));
    this._snedSearchOption.add(filteredResult);
  }
}
