part of 'router_imports.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: RouteConstants.home,
      builder: (context, state) => const Home(),
      routes: [
        _setURLSPageRoute,
        _materialPropertiesRoute,
        _transactionsPageRoute
      ],
    ),
  ],
);

final _setURLSPageRoute = GoRoute(
  path: 'set-url',
  name: RouteConstants.setUrlsPage,
  builder: (context, state) => const SetUrlPage(),
  routes: const [],
);

final _materialPropertiesRoute = GoRoute(
  path: 'mat-prop/:id',
  name: RouteConstants.matPropertiesPage,
  builder: (context, state) => MaterialPropertiesPage(
    material: state.pathParameters['id']!,
  ),
  routes: const [],
);

final _transactionsPageRoute = GoRoute(
  path: 'transaction/:name',
  name: RouteConstants.fillDetailsForTransactionsPage,
  builder: (context, state) => FillDetailsForTransactionsPage(
    name: state.pathParameters['name']!,
  ),
  routes: const [],
);
