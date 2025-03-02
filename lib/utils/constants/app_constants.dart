// ignore_for_file: constant_identifier_names
const String ZIM_PICK_SRV = '/sap/opu/odata/sap/ZIM_PICK_SRV';
const String loginMetaDataEndpoint = '$ZIM_PICK_SRV/\$metadata';

const String defaultFont = 'Montserrat';

class RivConstants {
  static const _animationPath = 'assets/animations';
  static String cartAnimation = '$_animationPath/CartAnimation.riv';
  static String earthAnimation = '$_animationPath/EarthAnimation.riv';
  static String earthAnim = '$_animationPath/earth.riv';
  static String littleBoy = '$_animationPath/little-boy.riv';
  static String space = '$_animationPath/space.riv';
  static String vehicles = '$_animationPath/vehicles.riv';
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
