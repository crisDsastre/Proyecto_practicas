import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';

void showSaveDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: MainTheme.backgroundColor,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.85,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Detection name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text("Detección #1"),
                const Divider(thickness: 1.2, color: Colors.black26),

                const SizedBox(height: 12),
                Row(
                  children: const [
                    Icon(Icons.location_on, color: MainTheme.iconSettingsColor),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Avd. de la prueba X",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: MainTheme.iconSettingsColor),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Text(
                  "Tags",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                TextField(
                  decoration: InputDecoration(
                    prefixText: "#",
                    hintText: "Tag...",
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                Wrap(
                  spacing: 9,
                  runSpacing: 9,
                  children: List.generate(3, (index) {
                    return Chip(
                      label: Text(
                        "#TagsEquipo1",
                        style: TextStyle(
                          fontSize: 10,
                          color: MainTheme.textColorDark,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: MainTheme.textColorDark),
                      ),
                      backgroundColor: Colors.transparent,
                      deleteIcon: const Icon(
                        Icons.close,
                        size: 16,
                        color: MainTheme.textColorDark,
                      ),
                      onDeleted: () {},
                    );
                  }),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MainTheme.backgroundColorSection,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
