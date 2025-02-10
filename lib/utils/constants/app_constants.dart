// ignore_for_file: constant_identifier_names
const String ZIM_PICK_SRV = '/sap/opu/odata/sap/ZIM_PICK_SRV';
const String loginMetaDataEndpoint = '$ZIM_PICK_SRV/\$metadata';

const String defaultFont = 'Montserrat';

class RivConstants {
  static const animationPath = 'assets/animations';
  static String cartAnimation = '$animationPath/CartAnimation.riv';
  static String earthAnimation = '$animationPath/EarthAnimation.riv';
}

class ImageConstant {
  //common paths
  static String imagePath = 'assets/images';
  static String svgPath = 'assets/svgs';

  //SVGs
  static String manLoginPageSVG = '$svgPath/login-page-image-man.svg';
  static String logoCompanySVG = '$svgPath/company-logo.svg';
  //PNG
  static String imageNotFound = '$imagePath/image_not_found.png';

  //JPG
  static String palletJpg = '$imagePath/Pallet.jpg';
}

class HiveConstants {
  static const String settingsBox = 'settings_box';
  static const String docBarcodesBox = 'doc_barcodes_box';
  static const String hhtDirectory = 'hht_box';
  static const String materialDirectory = 'material_box';
}
