# dart_hero_tour

A web app that uses [AngularDart](https://webdev.dartlang.org/angular) and
[AngularDart Components](https://webdev.dartlang.org/components).

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
"# AngularDartHeroTour" 

This is a custom Hero Tour App website. All heroes are categorized into different ability types: **Fire, Water, Ground, Wind, and Thunder**.

### The following table describes features' structure:

| File | Description |
|-----------|-------------|
| app_component.dart  | Entry component of Hero Tour App  |
| hero_tour_route_component.dart  | Routing |
| dashboard_component.dart | Hero dashboard  |
| hero_tour_list_component.dart | Display all heroes  |
| hero_search.dart | Search heroes  |
| hero_edit.dart | Add new heroes  |
| hero_component.dart | Display hero information  |
| hero_data_service.dart | Backend APIs |
| next_generate_hero.dart | Data model for hero related classes |

## How to use
1. Download or clone this repository, then go to its root directory, and run `pub get` command to install required dependencies.
2. After all dependencies be installed, then run `webdev serve` to start this app.

## Note
Because this project uses a real backend server for getting heroes data, so it is possible that the server goes down and the website will report errors. In this case, please notify me to make server back online again.