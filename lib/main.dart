import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/base/local_db/local_hive_db_service.dart';
import 'package:shopsy/feature/product/view/product_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await LocalHiveDBService().init();
    LocalHiveDBService().printStatus();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopsy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProductView(),
    );
  }
}
