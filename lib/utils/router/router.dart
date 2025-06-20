part of 'router_imports.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => const LoginPage(),
      builder: (context, state) => const Home(),
      routes: [
        _homeRoute,
        // _pickingRoute,
      ],
    ),
  ],
);

// ignore: unused_element
final _homeRoute = GoRoute(
  path: 'home',
  name: RouteConstants.home,
  builder: (context, state) => const Home(),
  routes: [..._transactionRoutes, _inventoryPageRoute, _materialsPageRoute],
);

List<RouteBase> _transactionRoutes = <RouteBase>[];

final _inventoryPageRoute = GoRoute(
  path: 'inventory',
  name: RouteConstants.inventoryPage,
  builder: (context, state) => const InventoryPage(),
  routes: const [],
);

final _materialsPageRoute = GoRoute(
  path: 'materials',
  name: RouteConstants.materialsPage,
  builder: (context, state) => const MaterialsPage(),
  routes: const [],
);
