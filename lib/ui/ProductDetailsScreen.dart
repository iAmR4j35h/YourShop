import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_product/Utils.dart';
import 'package:your_product/bloc/BlocProvider.dart';
import 'package:your_product/bloc/ProductsBloc.dart';
import 'package:your_product/hive/models/ProductModel.dart';
import 'package:your_product/ui/widgets/AppBarWidget.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductModel product;

  ProductDetailsScreen(this.product);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  final url = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBarWidget(
              showBack: true,
              showCart: true,
            ),
            Image.network(
              url,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Text(
                widget.product.name,
                style: TextStyle(fontSize: 35, fontFamily: 'nunito'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Variants",
                style: TextStyle(fontSize: 20, fontFamily: 'overlock'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: widget.product.variants.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  var item = widget.product.variants[index];
                  return new Card(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (item.color != null) Text("Color"),
                              if (item.color != null)
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    item.color.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Utils.primaryColor,
                                        fontFamily: "nunito",
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              if (item.size != null) Text("Size"),
                              if (item.size != null)
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    item.size.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Utils.primaryColor,
                                        fontFamily: "nunito",
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              Text("Price"),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Rs. " + item.price.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Utils.primaryColor,
                                      fontFamily: "nunito",
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Utils.primaryColor)),
                                    onPressed: () {},
                                    color: Utils.primaryColor,
                                    textColor: Colors.white,
                                    child: Text("Add to Cart".toUpperCase(), style: TextStyle(fontSize: 10)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
