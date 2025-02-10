enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev App';
      case Flavor.prod:
        return 'Prod App';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://localhost:8000';
      case Flavor.prod:
        //TODO Add actual prod base URL here
        return 'https://localhost:8000';
      default:
        return 'https://localhost:8000';
    }
  }
}
