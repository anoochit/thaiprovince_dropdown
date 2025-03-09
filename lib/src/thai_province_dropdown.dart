import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thai_province/src/models/thai_amphures.dart';
import 'package:thai_province/src/models/thai_provinces.dart';
import 'package:thai_province/src/models/thai_tambons.dart';
import 'package:thai_province/src/thai_province_controller.dart';

class ThaiProvincesDropdown extends StatefulWidget {
  const ThaiProvincesDropdown({
    super.key,
    required this.padding,
    this.width = 280.0,
    required this.locale,
    required this.controller,
    required this.direction,
  });

  final EdgeInsets padding;
  final double width;
  final Locale locale;
  final ThaiProvincesController controller;
  final Axis direction;

  @override
  State<ThaiProvincesDropdown> createState() => _ThaiProvincesDropdownState();
}

class _ThaiProvincesDropdownState extends State<ThaiProvincesDropdown> {
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
    _localeTH = (widget.locale == Locale('th', 'TH'));
    // load asset data
    _loadAssets();
  }

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

  @override
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: widget.direction,
      children: [
        // province
        DropdownButton<int>(
          menuWidth: widget.width,
          value: widget.controller.provinceId,
          items:
              _provinces
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(_localeTH ? e.nameTh! : e.nameEn!),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            //
            setState(() {
              widget.controller.provinceId = value;
              widget.controller.amphureId = null;
              _amphuresDropdown =
                  _amphures.where((p) => (p.provinceId == value)).toList();
            });
          },
        ),

        // amphure
        DropdownButton<int>(
          value: widget.controller.amphureId,
          items:
              _amphuresDropdown
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(_localeTH ? e.nameTh! : e.nameEn!),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            //
            setState(() {
              widget.controller.amphureId = value;
              widget.controller.tambonId = null;
              _tambonsDropdown =
                  _tambons.where((p) => (p.amphureId == value)).toList();
            });
          },
        ),

        // tambol
        DropdownButton<int>(
          value: widget.controller.tambonId,
          items:
              _tambonsDropdown
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(_localeTH ? e.nameTh! : e.nameEn!),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            //
            setState(() {
              widget.controller.tambonId = value;
              widget.controller.zipcode =
                  _tambons.firstWhere((p) => (p.id == value)).zipCode!;
            });
          },
        ),
      ],
    );
  }
}
