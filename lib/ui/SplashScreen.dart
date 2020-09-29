import 'dart:async';

import 'package:flutter/cupertino.dart';
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
import 'package:your_product/ui/CategoriesScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "YourShop",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Utils.primaryColor,
                      fontFamily: "lg",
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Text(
                    "One place solution for all you shopping needs...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, color: Utils.primaryColor, fontFamily: "nunito", decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  startTime() async {
    final ProductsBloc bloc = BlocProvider.of(context);
    // bloc.fetchData();
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => new CategoriesScreen(null)),
      (Route<dynamic> route) => false,
    );
  }
}
