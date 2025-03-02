// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/thai_amphures.dart';
import 'models/thai_provinces.dart';
import 'models/thai_tambons.dart';

class ThaiProvincesDropdownController {
  int provinceId = 0;
  int amphureId = 0;
  int tambonId = 0;
  int zipcode = 0;
}

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
  final ThaiProvincesDropdownController controller;
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

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.direction,
      children: [
        // province
        Padding(
          padding: widget.padding,
          child: DropdownMenu(
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
            onSelected: (value) {
              widget.controller.provinceId = value!;
              setState(() {
                _amphuresDropdown =
                    _amphures
                        .where(
                          (p) => (p.provinceId == widget.controller.provinceId),
                        )
                        .toList();
              });
            },
          ),
        ),

        // amphure
        Padding(
          padding: widget.padding,
          child: DropdownMenu(
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

            onSelected: (value) {
              widget.controller.amphureId = value!;
              setState(() {
                _tambonsDropdown =
                    _tambons
                        .where(
                          (p) => (p.amphureId == widget.controller.amphureId),
                        )
                        .toList();
              });
            },
          ),
        ),

        // district
        Padding(
          padding: widget.padding,
          child: DropdownMenu(
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
            onSelected: (value) {
              widget.controller.tambonId = value!;
              widget.controller.zipcode =
                  _tambons.firstWhere((p) => (p.id == value)).zipCode!;
            },
          ),
        ),
      ],
    );
  }

  Future<void> _loadAssets() async {
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
