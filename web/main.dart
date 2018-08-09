import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dart_hero_tour/app_component.template.dart' as ng;

import 'package:http/browser_client.dart';
import 'package:dart_hero_tour/in_memory_data_service.dart';

import './main.template.dart' as self;

import 'package:http/http.dart';

@GenerateInjector([
  routerProvidersHash,
  // ClassProvider(BrowserClient),
  ClassProvider(Client, useClass: InMemoryDataService),
])

// self.injector$Injector
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
