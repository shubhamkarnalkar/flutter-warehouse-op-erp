import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/utils/router/router_imports.dart';

import '../controllers/settings_controller.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key, this.transitionDuration = 100});

  /// Declare transition duration.
  final int transitionDuration;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int selectedNavigation = 0;
  int _transitionDuration = 100;

  // Initialize transition time variable.
  @override
  void initState() {
    super.initState();
    setState(() {
      _transitionDuration = widget.transitionDuration;
    });
  }

  @override
  Widget build(BuildContext context) {
    final NavigationRailThemeData navRailTheme =
        Theme.of(context).navigationRailTheme;

    // #docregion Example
    // AdaptiveLayout has a number of slots that take SlotLayouts and these
    // SlotLayouts' configs take maps of Breakpoints to SlotLayoutConfigs.
    return SafeArea(
      child: MediaQuery(
        data: const MediaQueryData().copyWith(
          textScaler: TextScaler.linear(
            ref.watch(settingsControllerProvider).textScaleFactor,
          ),
        ),
        child: AdaptiveLayout(
          // An option to override the default transition duration.
          transitionDuration: Duration(milliseconds: _transitionDuration),
          // Primary navigation config has nothing from 0 to 600 dp screen width,
          // then an unextended NavigationRail with no labels and just icons then an
          // extended NavigationRail with both icons and labels.
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.medium: SlotLayout.from(
                inAnimation: AdaptiveScaffold.leftOutIn,
                key: const Key('Primary Navigation Medium'),
                builder: (_) => AdaptiveScaffold.standardNavigationRail(
                  width: 100,
                  selectedIndex: selectedNavigation,
                  padding: const EdgeInsets.all(0),
                  onDestinationSelected: (int newIndex) {
                    setState(() {
                      selectedNavigation = newIndex;
                    });
                  },
                  leading: const SizedBox(
                    height: 50,
                  ),
                  destinations: RouteConstants.navigationItems
                      .map((NavigationDestination destination) =>
                          AdaptiveScaffold.toRailDestination(destination))
                      .toList(),
                  labelType: NavigationRailLabelType.all,
                  backgroundColor: navRailTheme.backgroundColor,
                  selectedIconTheme: navRailTheme.selectedIconTheme,
                  unselectedIconTheme: navRailTheme.unselectedIconTheme,
                  selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                  unSelectedLabelTextStyle:
                      navRailTheme.unselectedLabelTextStyle,
                ),
              ),
              Breakpoints.large: SlotLayout.from(
                key: const Key('Primary Navigation Large'),
                inAnimation: AdaptiveScaffold.leftOutIn,
                builder: (_) => AdaptiveScaffold.standardNavigationRail(
                  selectedIndex: selectedNavigation,
                  padding: const EdgeInsets.all(0),
                  onDestinationSelected: (int newIndex) {
                    setState(() {
                      selectedNavigation = newIndex;
                    });
                  },
                  extended: true,
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 63,
                    // child: CircleAvatar(
                    //   radius: 60,
                    //   backgroundImage: AssetImage(treeImage),
                    // ),
                  ),
                  destinations: RouteConstants.navigationItems
                      .map((NavigationDestination destination) =>
                          AdaptiveScaffold.toRailDestination(destination))
                      .toList(),
                  // trailing: trailingNavRail,
                  backgroundColor: navRailTheme.backgroundColor,
                  selectedIconTheme: navRailTheme.selectedIconTheme,
                  unselectedIconTheme: navRailTheme.unselectedIconTheme,
                  selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                  unSelectedLabelTextStyle:
                      navRailTheme.unselectedLabelTextStyle,
                ),
              ),
            },
          ),
          // Body switches between a ListView and a GridView from small to medium
          // breakpoints and onwards.
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('Body Small'),
                builder: (_) =>
                    RouteConstants.getScreen(context, selectedNavigation),
              ),
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('Body Medium'),
                builder: (_) =>
                    RouteConstants.getScreen(context, selectedNavigation),
              )
            },
          ),
          // BottomNavigation is only active in small views defined as under 600 dp
          // width.
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('Bottom Navigation Small'),
                inAnimation: AdaptiveScaffold.bottomToTop,
                outAnimation: AdaptiveScaffold.topToBottom,
                builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                  destinations: RouteConstants.navigationItems,
                  currentIndex: selectedNavigation,
                  onDestinationSelected: (int newIndex) {
                    setState(() {
                      selectedNavigation = newIndex;
                    });
                  },
                ),
              )
            },
          ),
        ),
      ),
    );
    // #enddocregion Example
  }
}
