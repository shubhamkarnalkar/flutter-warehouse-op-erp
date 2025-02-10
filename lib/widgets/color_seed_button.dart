import 'package:flutter/material.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final colorProvider = StateProvider<ColorSeed>((ref) {
  final seedId = ref
      .watch(settingsControllerProvider.select((value) => value.seedColorId));
  return ColorSeed.values.firstWhere((element) => element.id == seedId);
});

enum ColorSelectionMethod {
  colorSeed,
  image,
}

enum ColorSeed {
  baseColor(0, 'M3 Baseline', Color(0xff6750a4)),

  indigo(1, 'Indigo', Colors.indigo),

  blue(2, 'Blue', Colors.blue),

  teal(3, 'Teal', Colors.teal),

  yellow(4, 'Yellow', Colors.yellow),

  orange(5, 'Orange', Colors.orange),

  deepOrange(6, 'Deep Orange', Colors.deepOrange),

  defaultValue(7, 'Default', Pallete.green),

  pink(8, 'Pink', Colors.pink);

  const ColorSeed(this.id, this.label, this.color);
  final int id;
  final String label;
  final Color color;
}

enum ScreenSelected {
  component(0),
  color(1),
  typography(2),
  elevation(3);

  const ScreenSelected(this.value);
  final int value;
}

class ColorSeedButton extends StatelessWidget {
  const ColorSeedButton({
    super.key,
    required this.handleColorSelect,
    required this.colorSelected,
    this.colorSelectionMethod = ColorSelectionMethod.colorSeed,
  });

  final void Function(int) handleColorSelect;
  final ColorSeed colorSelected;
  final ColorSelectionMethod? colorSelectionMethod;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.palette_outlined,
        color: colorSelected.color,
      ),
      tooltip: 'Select a seed color',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(ColorSeed.values.length, (index) {
          ColorSeed currentColor = ColorSeed.values[index];

          return PopupMenuItem(
            value: index,
            enabled: currentColor != colorSelected ||
                colorSelectionMethod != ColorSelectionMethod.colorSeed,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    currentColor == colorSelected &&
                            colorSelectionMethod != ColorSelectionMethod.image
                        ? Icons.color_lens
                        : Icons.color_lens_outlined,
                    color: currentColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentColor.label),
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleColorSelect,
    );
  }
}
