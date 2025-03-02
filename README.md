# Thai Province Dropdown

A simple Thai province dropdown widget for Flutter.

## Example

```dart
final controller = ThaiProvincesDropdownController();
```

```dart
ThaiProvincesDropdown(
  controller: thaiProvincesController,
  direction: Axis.vertical,
  width: 280.0,
  padding: EdgeInsets.all(4.0),
  locale: Locale('en', 'US'),
),

```

```dart
Text('province = ${controller.provinceId}'),
Text('district = ${controller.amphureId}'),
Text('subdistrict = ${controller.tambonId}'),
Text('zipcoce = ${controller.zipcode}'),
```
