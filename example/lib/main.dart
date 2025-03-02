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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Province'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = ThaiProvincesDropdownController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Text('province = ${controller.provinceId}'),
            Text('district = ${controller.amphureId}'),
            Text('subdistrict = ${controller.tambonId}'),
            Text('zipcoce = ${controller.zipcode}'),
            SizedBox(height: 4.0),
            //
            ThaiProvincesDropdown(
              controller: controller,
              direction: Axis.vertical,
              width: 280.0,
              padding: EdgeInsets.all(4.0),
              locale: Locale('en', 'US'),
            ),
            SizedBox(height: 4.0),
            //
            FilledButton(
              onPressed: () {
                //
                setState(() {});
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
