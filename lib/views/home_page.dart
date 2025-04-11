import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../utils/utils.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key, this.transitionDuration = 20});

  /// Declare transition duration.
  final int transitionDuration;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int selectedNavigation = 0;
  int _transitionDuration = 20;

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
    const consClr = 'Orange & Navy Blue';
    final List<Color> dynColors = [
      Pallete.colorCombi[consClr]?['text'] ?? Colors.black,
      Pallete.colorCombi[consClr]?['background'] ?? Colors.amber
    ];
    final theme = Theme.of(context);

    // AdaptiveLayout has a number of slots that take SlotLayouts and these
    // SlotLayouts' configs take maps of Breakpoints to SlotLayoutConfigs.
    return AdaptiveLayout(
      // An option to override the default transition duration.
      transitionDuration: Duration(milliseconds: _transitionDuration),
      // Primary navigation config has nothing from 0 to 600 dp screen width,
      // then an unextended NavigationRail with no labels and just icons then an
      // extended NavigationRail with both icons and labels.
      primaryNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
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
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  child: AvatarForHome(
                    dynColors: dynColors,
                    theme: theme,
                    radius: 40,
                  ),
                ),
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
              unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
            ),
          ),
          Breakpoints.large: SlotLayout.from(
            key: const Key('Primary Navigation Large'),
            //   builder: (context) => RouteConstants.navigationWindow(
            //       width: 280,
            //       selectedIndex: selectedNavigation,
            //       onDestinationSelected: (int newIndex) {
            //         setState(() {
            //           selectedNavigation = newIndex;
            //         });
            //       },
            //       leading: AvatarForHome(dynColors: dynColors, theme: theme),
            //       // destinations:
            //       //     RouteConstants.getRailItems(theme, selectedNavigation),
            //       destinations: RouteConstants.navigationItems
            //           .map((NavigationDestination destination) =>
            //               AdaptiveScaffold.toRailDestination(destination))
            //           .toList(),
            //       theme: theme),
            builder: (_) => AdaptiveScaffold.standardNavigationRail(
              selectedIndex: selectedNavigation,
              width: 320,
              padding: const EdgeInsets.all(0),
              onDestinationSelected: (int newIndex) {
                setState(() {
                  selectedNavigation = newIndex;
                });
              },
              extended: true,
              leading: AvatarForHome(dynColors: dynColors, theme: theme),
              destinations:
                  RouteConstants.getRailItems(theme, selectedNavigation),
              backgroundColor: navRailTheme.backgroundColor,
              selectedIconTheme: navRailTheme.selectedIconTheme,
              unselectedIconTheme: navRailTheme.unselectedIconTheme,
              selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
              unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
              // labelType: NavigationRailLabelType.all,
            ),
          ),
        },
      ),
      // Body switches between a ListView and a GridView from small to medium
      // breakpoints and onwards.
      body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
        Breakpoints.small: SlotLayout.from(
          key: const Key('Body Small'),
          builder: (_) => RouteConstants.getScreen(context, selectedNavigation),
        ),
        Breakpoints.mediumAndUp: SlotLayout.from(
          key: const Key('Body Medium'),
          builder: (_) => RouteConstants.getScreen(context, selectedNavigation),
        ),
      }),
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
          ),
        },
      ),
    );
  }
}

class AvatarForHome extends StatelessWidget {
  const AvatarForHome({
    super.key,
    required this.dynColors,
    required this.theme,
    this.radius = 60,
  });

  final List<Color> dynColors;
  final ThemeData theme;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: dynColors[1],
      radius: radius ?? 60 + 2,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: dynColors[0],
        child: Text(
          'U',
          style: theme.textTheme.displayLarge!.copyWith(color: dynColors[1]),
        ),
      ),
    );
  }
}
