// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../thai_province.dart';
import 'models/thai_amphures.dart';
import 'models/thai_provinces.dart';
import 'models/thai_tambons.dart';

/// A widget that provides a set of dropdown menus for selecting a Thai province,
/// district (amphure), and subdistrict (tambon).
class ThaiProvincesDropdownMenu extends StatefulWidget {
  /// Creates a [ThaiProvincesDropdownMenu] widget.
  ///
  /// [padding], [locale], [controller], and [direction] must not be null.
  const ThaiProvincesDropdownMenu({
    super.key,
    required this.padding,
    this.width = 280.0,
    required this.locale,
    required this.controller,
    required this.direction,
  });

  /// The padding around each dropdown menu.
  final EdgeInsets padding;

  /// The width of each dropdown menu.
  final double width;

  /// The current locale, used to determine the language for labels (Thai or English).
  final Locale locale;

  /// The controller to manage the selected province, district, subdistrict, and zipcode.
  final ThaiProvincesController controller;

  /// The direction in which the dropdown menus should be arranged (horizontal or vertical).
  final Axis direction;

  @override
  State<ThaiProvincesDropdownMenu> createState() =>
      _ThaiProvincesDropdownMenuState();
}

class _ThaiProvincesDropdownMenuState extends State<ThaiProvincesDropdownMenu> {
  List<ThaiTambons> _tambons = [];
  List<ThaiAmphures> _amphures = [];
  List<ThaiProvinces> _provinces = [];

  List<ThaiTambons> _tambonsDropdown = [];
  List<ThaiAmphures> _amphuresDropdown = [];

  bool _localeTH = false;

  @override
  void initState() {
    super.initState();
    // check locale
    _localeTH = (widget.locale == const Locale('th', 'TH'));
    // load asset data
    _loadAssets();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: widget.direction,
      children: [
        // province
        Padding(
          padding: widget.padding,
          child: DropdownMenu<int>(
            enableSearch: false,
            width: widget.width,
            hintText: (_localeTH) ? 'จังหวัด' : 'Province',
            dropdownMenuEntries:
                _provinces
                    .map(
                      (e) => DropdownMenuEntry<int>(
                        label: (_localeTH) ? '${e.nameTh}' : '${e.nameEn}',
                        value: e.id!,
                      ),
                    )
                    .toList(),
            onSelected: (int? value) {
              if (value != null) {
                widget.controller.provinceId = value;
                widget.controller.amphureId = null; // reset amphure
                widget.controller.tambonId = null; // reset tambon
                widget.controller.zipcode = null; //reset zipcode
                setState(() {
                  _amphuresDropdown =
                      _amphures
                          .where(
                            (p) =>
                                (p.provinceId == widget.controller.provinceId),
                          )
                          .toList();
                  _tambonsDropdown.clear();
                });
              }
            },
          ),
        ),

        // amphure
        Padding(
          padding: widget.padding,
          child: DropdownMenu<int>(
            width: widget.width,
            hintText: (_localeTH) ? 'อำเภอ' : 'District',
            dropdownMenuEntries:
                _amphuresDropdown
                    .map(
                      (e) => DropdownMenuEntry<int>(
                        label: (_localeTH) ? '${e.nameTh}' : '${e.nameEn}',
                        value: e.id!,
                      ),
                    )
                    .toList(),
            onSelected: (int? value) {
              if (value != null) {
                widget.controller.amphureId = value;
                widget.controller.tambonId = null; // reset tambon
                widget.controller.zipcode = null; //reset zipcode
                setState(() {
                  _tambonsDropdown =
                      _tambons
                          .where(
                            (p) => (p.amphureId == widget.controller.amphureId),
                          )
                          .toList();
                });
              }
            },
          ),
        ),

        // district
        Padding(
          padding: widget.padding,
          child: DropdownMenu<int>(
            width: widget.width,
            hintText: (_localeTH) ? 'ตำบล' : 'Subdistrict',
            dropdownMenuEntries:
                _tambonsDropdown
                    .map(
                      (e) => DropdownMenuEntry<int>(
                        label: (_localeTH) ? '${e.nameTh}' : '${e.nameEn}',
                        value: e.id!,
                      ),
                    )
                    .toList(),
            onSelected: (int? value) {
              if (value != null) {
                widget.controller.tambonId = value;
                widget.controller.zipcode =
                    _tambons.firstWhere((p) => (p.id == value)).zipCode!;
              }
            },
          ),
        ),
      ],
    );
  }

  /// Loads the Thai province, district, and subdistrict data from the asset files.
  Future<void> _loadAssets() async {
    log('load asset');
    final result = await Future.wait([
      rootBundle.loadString('packages/thai_province/assets/thai_tambons.json'),
      rootBundle.loadString('packages/thai_province/assets/thai_amphures.json'),
      rootBundle.loadString(
        'packages/thai_province/assets/thai_provinces.json',
      ),
    ]);

    setState(() {
      _tambons = thaiTambonsFromJson(result[0]);
      _amphures = thaiAmphuresFromJson(result[1]);
      _provinces = thaiProvincesFromJson(result[2]);
    });
  }
}
