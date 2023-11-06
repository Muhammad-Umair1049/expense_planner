import 'package:flutter/material.dart';

class ThemeSelectionWidget extends StatefulWidget {
  final String selectedTheme;
  final Function applyThemeCallback;

  ThemeSelectionWidget({
    required this.selectedTheme,
    required this.applyThemeCallback,
  });

  @override
  _ThemeSelectionWidgetState createState() => _ThemeSelectionWidgetState();
}

class _ThemeSelectionWidgetState extends State<ThemeSelectionWidget> {
  String selectedTheme = 'Light Theme'; // Initialize with a default selection

  @override
  void initState() {
    super.initState();
    selectedTheme = widget.selectedTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text('Themes'),
        ),
        themedButton(
          'Light Theme',
              () {
            setState(() {
              selectedTheme = 'Light Theme';
            });
          },
          selectedTheme == 'Light Theme',
        ),
        themedButton(
          'Dark Theme',
              () {
            setState(() {
              selectedTheme = 'Dark Theme';
            });
          },
          selectedTheme == 'Dark Theme',
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              widget.applyThemeCallback(
                  selectedTheme); // Apply the selected theme
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: Text('Apply'),
          ),
        ),
      ],
    );
  }

  Widget themedButton(String title, VoidCallback onPressed, bool isSelected) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isSelected ? Colors.green : Colors.white,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.color_lens,
                color: isSelected ? Colors.white : Colors.black,
                size: 24,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Spacer(),
            if (isSelected)
              Icon(
                Icons.check,
                size: 24,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
