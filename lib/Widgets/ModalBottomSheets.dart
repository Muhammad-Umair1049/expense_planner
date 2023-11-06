import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main.dart';
import 'package:flutter_complete_guide/widgets/themedButtons.dart';

void showThemesBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return ThemeSelectionWidget(
        selectedTheme: 'Light Theme', // Pass the selected theme here
        applyThemeCallback: (theme) {
          if (theme == 'Light Theme') {
            themeManager.toggleTheme(false);
          } else if (theme == 'Dark Theme') {
            themeManager.toggleTheme(true);
          }
        },
      );
    },
  );
}

void showSettingsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Column(
        children: [
          // App Bar with a "Settings" heading
          AppBar(
            title: Text('Settings'),
          ),
          // Profile button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Add your logic for the Profile button here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          // Themes button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                try {
                  showThemesBottomSheet(context);
                } catch (e) {}
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.color_lens,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Themes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          // Font Size button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Add your logic for the Font Size button here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.format_size,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Font Size',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
