// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../model/client_transactions_model.dart';
import '../ui/views/details/details_view.dart';
import '../ui/views/home_view/home_view.dart';
import '../ui/views/initial%20_view/initial_view.dart';

class Routes {
  static const String initialView = '/';
  static const String homeView = '/home-view';
  static const String detailsView = '/details-view';
  static const all = <String>{
    initialView,
    homeView,
    detailsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.initialView, page: InitialView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.detailsView, page: DetailsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    InitialView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const InitialView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    DetailsView: (data) {
      var args = data.getArgs<DetailsViewArguments>(
        orElse: () => DetailsViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DetailsView(
          key: args.key,
          model: args.model,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DetailsView arguments holder class
class DetailsViewArguments {
  final Key? key;
  final ClientTransactions? model;
  DetailsViewArguments({this.key, this.model});
}
