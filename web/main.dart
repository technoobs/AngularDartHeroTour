import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dart_hero_tour/app_component.template.dart' as ng;

import 'main.template.dart' as self;

@GenerateInjector(
  routerProvidersHash,
)

// self.injector$Injector
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
