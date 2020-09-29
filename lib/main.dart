import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:your_product/Utils.dart';
import 'package:your_product/bloc/BlocProvider.dart';
import 'package:your_product/bloc/ProductsBloc.dart';
import 'package:your_product/hive/HiveHelper.dart';
import 'package:your_product/hive/models/CategoryModel.dart';
import 'package:your_product/hive/models/ProductModel.dart';
import 'package:your_product/hive/models/RankingModel.dart';
import 'package:your_product/hive/models/RankingProductModel.dart';
import 'package:your_product/hive/models/TaxModel.dart';
import 'package:your_product/hive/models/VariantModel.dart';
import 'package:your_product/ui/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(TaxModelAdapter());
  Hive.registerAdapter(VariantModelAdapter());
  Hive.registerAdapter(RankingModelAdapter());
  Hive.registerAdapter(RankingProductModelAdapter());

  await Hive.openBox<CategoryModel>('categoryBox');
  await Hive.openBox<RankingModel>('rankingBox');
  await Hive.openBox<ProductModel>('productBox');
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application  .

  // initHive() async {
  //   var dir = await getApplicationDocumentsDirectory();
  //   Hive.init(dir.path);
  //   return;
  // }
  @override
  Widget build(BuildContext context) {
    // HiveHelper.init();
    ProductsBloc _bloc=ProductsBloc();
    _bloc.fetchData();

    return BlocProvider(
      bloc: _bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YourShop',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Utils.primaryColor,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
