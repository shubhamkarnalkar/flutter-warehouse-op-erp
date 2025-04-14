enum UrlsApp { base, materials, inventory, login }

class UrlsAppModel {
  final int id;
  final UrlsApp url;
  final String name;
  final String responseValue;

  UrlsAppModel(this.id, this.url, this.name, this.responseValue);

  static List<UrlsAppModel> urlTypes() {
    return <UrlsAppModel>[
      UrlsAppModel(0, UrlsApp.base, 'Base', ''),
      UrlsAppModel(1, UrlsApp.inventory, 'Inventory', ''),
      UrlsAppModel(2, UrlsApp.materials, 'Materials', ''),
      UrlsAppModel(3, UrlsApp.login, 'Login', ''),
      // UrlsAppModel(3, ),
    ];
  }
}
