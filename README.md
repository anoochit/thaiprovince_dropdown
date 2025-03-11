# Thai Province Dropdown

A Flutter widget for easily selecting Thai provinces, districts (amphures), subdistricts (tambons), and zip codes. This widget simplifies the process of filling out address forms with accurate Thai administrative division data.

**Key Features:**

* **Dropdown Selectors:** Intuitive dropdown menus for selecting province, district, and subdistrict.
* **Automatic Zip Code:** Automatically populates the zip code based on the selected subdistrict.
* **Data Driven:** Leverages comprehensive and up-to-date Thai administrative division data.
* **Customizable:** Adjust layout, size, padding, and language.
* **Controller**: easy access to selected values by `ThaiProvincesDropdownController`
* **Easy Integration:** Simple to integrate into existing Flutter projects.
* **Localization:** supports `en_US` and `th_TH` locale (more locales in future)

**Data Source:**

The underlying data for provinces, districts, subdistricts, and zip codes is sourced from [thai-province-data](https://github.com/kongvut/thai-province-data), ensuring accuracy and reliability.

**Getting Started**

1.  **Add Dependency:**

    Add `thai_province_dropdown` to your `pubspec.yaml` file:

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      thai_province_dropdown: ^0.0.1 
    ```

    Then run:
    ```bash
      flutter pub get
    ```

2.  **Import:**

    ```dart
    import 'package:thai_province_dropdown/thai_province_dropdown.dart';
    ```

3.  **Create a Controller:**

    Instantiate a `ThaiProvincesDropdownController` to manage the selected values:

    ```dart
    final ThaiProvincesDropdownController thaiProvincesController = ThaiProvincesDropdownController();
    ```

4.  **Use the Widget:**

    Integrate the `ThaiProvincesDropdown` widget into your UI, typically within a form:

    ```dart
    ThaiProvincesDropdown(
      controller: thaiProvincesController,
      direction: Axis.vertical, // Optional: Choose Axis.horizontal for a horizontal layout.
      width: 280.0,              // Optional: Set a custom width.
      padding: const EdgeInsets.all(4.0), // Optional: Customize padding.
      locale: const Locale('en', 'US'),   // Optional: Set the language (default is 'th_TH')
    )
    ```

5.  **Access Selected Values:**

    Retrieve the selected province, district, subdistrict IDs, and zip code from the controller:

    ```dart
    //Inside Widget Tree, after ThaiProvincesDropdown
    Text('Province ID: ${thaiProvincesController.provinceId}'),
    Text('District ID: ${thaiProvincesController.amphureId}'),
    Text('Subdistrict ID: ${thaiProvincesController.tambonId}'),
    Text('Zip Code: ${thaiProvincesController.zipcode}'),
    ```

**Complete Example:**

```dart
import 'package:flutter/material.dart';
import 'package:thai_province/thai_province.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Thai Province Dropdown Example'),
        ),
        body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final ThaiProvincesDropdownController thaiProvincesController = ThaiProvincesDropdownController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ThaiProvincesDropdown(
          controller: thaiProvincesController,
          direction: Axis.vertical,
          width: 300,
          padding: const EdgeInsets.all(8.0),
          locale: const Locale('en', 'US'),
        ),
        const SizedBox(height: 20),
        Text('Province ID: ${thaiProvincesController.provinceId}'),
        Text('District ID: ${thaiProvincesController.amphureId}'),
        Text('Subdistrict ID: ${thaiProvincesController.tambonId}'),
        Text('Zip Code: ${thaiProvincesController.zipcode}'),
      ],
    );
  }
}
