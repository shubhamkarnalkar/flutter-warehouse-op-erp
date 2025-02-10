// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lightThemeProvider = StateProvider<ThemeData>((ref) {
  return ref.watch(themeProvider.notifier).getLight();
});

final darkThemeProvider = StateProvider<ThemeData>((ref) {
  return ref.watch(themeProvider.notifier).getDark();
});

final themeProvider = StateNotifierProvider<ThemeValueNotifier, bool>((ref) {
  return ThemeValueNotifier(ref.watch(colorProvider));
});

class ThemeValueNotifier extends StateNotifier<bool> {
  final ColorSeed colorSeed;
  ThemeValueNotifier(
    this.colorSeed,
  ) : super(false);

  ThemeData getDark() {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: colorSeed.color,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  ThemeData getLight() {
    return ThemeData.light().copyWith(
      // textTheme: TextThemes.textTheme(),
      colorScheme: ColorScheme.fromSeed(seedColor: colorSeed.color),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      // textButtonTheme: const TextButtonThemeData(
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStatePropertyAll(
      //       Color(0xff7DDA58),
      //     ),
      //   ),
      // ),
    );
  }
}

// PrimaryColors get appTheme => ThemeHelper().themeColor();
// ThemeData get theme => ThemeHelper().themeData();

// /// Helper class for managing themes and colors.

// class ThemeHelper {
//   /// Returns the primary colors for the current theme.
//   PrimaryColors _getThemeColors() {
//     return PrimaryColors();
//   }

//   /// Returns the current theme data.
//   ThemeData _getThemeData() {
//     var colorScheme = ColorSchemes.primaryColorScheme;
//     return ThemeData.dark().copyWith(
//       visualDensity: VisualDensity.standard,
//       textButtonTheme: const TextButtonThemeData(
//         style: ButtonStyle(
//           textStyle: MaterialStatePropertyAll(
//             TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       colorScheme: colorScheme,
//       textTheme: Typography()
//           .black
//           .apply(fontFamily: defaultFont, bodyColor: Colors.white),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colorScheme.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//           visualDensity: const VisualDensity(
//             vertical: -4,
//             horizontal: -4,
//           ),
//           padding: EdgeInsets.zero,
//         ),
//       ),
//     );
//   }

//   /// Returns the primary colors for the current theme.
//   PrimaryColors themeColor() => _getThemeColors();

//   /// Returns the current theme data.
//   ThemeData themeData() => _getThemeData();
// }

// /// Class containing the supported color schemes.
// class ColorSchemes {
//   static const primaryColorScheme = ColorScheme.dark(
//     primary: Color(0XFF7DDA58),
//     secondaryContainer: Color(0XFFF2B5AA),
//     onPrimary: Color(0XFF343A48),
//     onPrimaryContainer: Color(0XFFFFFFFF),
//   );
// }

// /// Class containing custom colors for a primary theme.
// class PrimaryColors {
//   // Black
//   Color get black900 => const Color(0XFF000000);
// // Blue
//   Color get blue400 => const Color(0XFF4CA1E6);
// // BlueGray
//   Color get blueGray400 => const Color(0XFF888888);
// // Gray
//   Color get gray200 => const Color(0XFFEBEBEB);
// // Green
//   Color get green50 => const Color(0XFFE2F2E8);
// // Indigo
//   Color get indigo700 => const Color(0XFF2B499C);
// // Orange
//   Color get orange700 => const Color(0XFFFF8100);
// }

// // @immutable
// // class BasilTheme extends ThemeExtension<BasilTheme> {
//   const BasilTheme({
//     this.primaryColor = const Color(0xFF356859),
//     this.tertiaryColor = const Color(0xFFFF5722),
//     this.neutralColor = const Color(0xFFFFFBE6),
//   });

//   final Color primaryColor;
//   final Color tertiaryColor;
//   final Color neutralColor;

//   Scheme _scheme() {
//     final base = CorePalette.of(primaryColor.value);
//     final primary = base.primary;
//     final tertiary = CorePalette.of(tertiaryColor.value).primary;
//     final neutral = CorePalette.of(neutralColor.value).neutral;
//     return Scheme(
//       primary: primary.get(40),
//       onPrimary: primary.get(100),
//       primaryContainer: primary.get(90),
//       onPrimaryContainer: primary.get(10),
//       secondary: base.secondary.get(40),
//       onSecondary: base.secondary.get(100),
//       secondaryContainer: base.secondary.get(90),
//       onSecondaryContainer: base.secondary.get(10),
//       tertiary: tertiary.get(40),
//       onTertiary: tertiary.get(100),
//       tertiaryContainer: tertiary.get(90),
//       onTertiaryContainer: tertiary.get(10),
//       error: base.error.get(40),
//       onError: base.error.get(100),
//       errorContainer: base.error.get(90),
//       onErrorContainer: base.error.get(10),
//       background: neutral.get(99),
//       onBackground: neutral.get(10),
//       surface: neutral.get(99),
//       onSurface: neutral.get(10),
//       outline: base.neutralVariant.get(50),
//       outlineVariant: base.neutralVariant.get(80),
//       surfaceVariant: base.neutralVariant.get(90),
//       onSurfaceVariant: base.neutralVariant.get(30),
//       shadow: neutral.get(0),
//       scrim: neutral.get(0),
//       inverseSurface: neutral.get(20),
//       inverseOnSurface: neutral.get(95),
//       inversePrimary: primary.get(80),
//     );
//   }

//   ThemeData _base(final ColorScheme colorScheme) {
//     // final primaryTextTheme = GoogleFonts.lektonTextTheme();
//     // final secondaryTextTheme = GoogleFonts.montserratTextTheme();
//     // final textTheme = primaryTextTheme.copyWith(
//     //   displaySmall: secondaryTextTheme.displaySmall,
//     //   displayMedium: secondaryTextTheme.displayMedium,
//     //   displayLarge: secondaryTextTheme.displayLarge,
//     //   headlineSmall: secondaryTextTheme.headlineSmall,
//     //   headlineMedium: secondaryTextTheme.headlineMedium,
//     //   headlineLarge: secondaryTextTheme.headlineLarge,
//     // );
//     final isLight = colorScheme.brightness == Brightness.light;
//     return ThemeData(
//       useMaterial3: true,
//       extensions: [this],
//       colorScheme: colorScheme,
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
//       // textTheme: textTheme,
//       tabBarTheme: TabBarTheme(
//         labelColor: colorScheme.onSurface,
//         unselectedLabelColor: colorScheme.onSurface,
//         indicator: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(color: colorScheme.primary, width: 2),
//           ),
//         ),
//       ),
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//           backgroundColor: colorScheme.secondaryContainer,
//           foregroundColor: colorScheme.onSecondaryContainer),
//       navigationRailTheme: NavigationRailThemeData(
//         backgroundColor: isLight ? neutralColor : colorScheme.surface,
//         // backgroundColor: Color.fromARGB(202, 148, 230, 190),
//         selectedIconTheme:
//             IconThemeData(color: colorScheme.onSecondaryContainer),
//         indicatorColor: colorScheme.secondaryContainer,
//         selectedLabelTextStyle: const TextStyle().copyWith(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       appBarTheme: AppBarTheme(
//           backgroundColor: isLight ? neutralColor : colorScheme.surface),
//       chipTheme: ChipThemeData(
//           backgroundColor: isLight ? neutralColor : colorScheme.surface),
//     );
//   }

//   ThemeData toThemeData() {
//     final colorScheme = _scheme().toColorScheme(Brightness.light);
//     return _base(colorScheme).copyWith(brightness: colorScheme.brightness);
//   }

//   @override
//   ThemeExtension<BasilTheme> copyWith({
//     Color? primaryColor,
//     Color? tertiaryColor,
//     Color? neutralColor,
//   }) =>
//       BasilTheme(
//         primaryColor: primaryColor ?? this.primaryColor,
//         tertiaryColor: tertiaryColor ?? this.tertiaryColor,
//         neutralColor: neutralColor ?? this.neutralColor,
//       );

//   @override
//   BasilTheme lerp(
//     covariant ThemeExtension<BasilTheme>? other,
//     double t,
//   ) {
//     if (other is! BasilTheme) return this;
//     return BasilTheme(
//       primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
//       tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
//       neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
//     );
//   }
// }

// extension on Scheme {
//   ColorScheme toColorScheme(Brightness brightness) {
//     return ColorScheme(
//         primary: Color(primary),
//         onPrimary: Color(onPrimary),
//         primaryContainer: Color(primaryContainer),
//         onPrimaryContainer: Color(onPrimaryContainer),
//         secondary: Color(secondary),
//         onSecondary: Color(onSecondary),
//         secondaryContainer: Color(secondaryContainer),
//         onSecondaryContainer: Color(onSecondaryContainer),
//         tertiary: Color(tertiary),
//         onTertiary: Color(onTertiary),
//         tertiaryContainer: Color(tertiaryContainer),
//         onTertiaryContainer: Color(onTertiaryContainer),
//         error: Color(error),
//         onError: Color(onError),
//         errorContainer: Color(errorContainer),
//         onErrorContainer: Color(onErrorContainer),
//         outline: Color(outline),
//         outlineVariant: Color(outlineVariant),
//         background: Color(background),
//         onBackground: Color(onBackground),
//         surface: Color(surface),
//         onSurface: Color(onSurface),
//         surfaceVariant: Color(surfaceVariant),
//         onSurfaceVariant: Color(onSurfaceVariant),
//         inverseSurface: Color(inverseSurface),
//         onInverseSurface: Color(inverseOnSurface),
//         inversePrimary: Color(inversePrimary),
//         shadow: Color(shadow),
//         scrim: Color(scrim),
//         surfaceTint: Color(primary),
//         brightness: brightness);
//   }
// }
