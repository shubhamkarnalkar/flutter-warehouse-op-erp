part of 'router_imports.dart';

class RouteConstants {
  static const String home = 'Home';
  static const String settings = 'Settings';
  static const String transactions = 'Transactions';
  static const String sync = 'Sync';
  static const String fullPalletPickingPage = 'FullPalletPickingPage';
  static const String pickingEnterDelivery = 'EnterDeliveryPage';
  static const String pickingOptionsPage = 'PickingOptionsPage';
  static const String materialsPage = 'MaterialsPage';
  static const String inventoryPage = 'InventoryPage';

// These are the navigation screens on the home screen
  static const List<NavigationDestination> navigationItems = [
    NavigationDestination(
      icon: Icon(Icons.sort_by_alpha_outlined),
      selectedIcon: Icon(Icons.sort_by_alpha_rounded),
      label: 'Show Animation',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_applications_outlined),
      selectedIcon: Icon(Icons.settings_applications_rounded),
      label: 'Settings',
    ),
  ];
  static Widget getScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        return const ShowAnimationPage();
      case 1:
        return const SettingsPage();
      default:
        return const Text('Something went wrong');
    }
  }
}
