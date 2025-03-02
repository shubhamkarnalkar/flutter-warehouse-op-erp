part of 'router_imports.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => const LoginPage(),
      builder: (context, state) => const Home(),
      routes: [
        _setURLSPageRoute,
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
