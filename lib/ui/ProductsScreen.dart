import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_product/Utils.dart';
import 'package:your_product/bloc/BlocProvider.dart';
import 'package:your_product/bloc/ProductsBloc.dart';
import 'package:your_product/hive/models/ProductModel.dart';
import 'package:your_product/hive/models/RankingModel.dart';
import 'package:your_product/ui/ProductDetailsScreen.dart';
import 'package:your_product/ui/widgets/AppBarWidget.dart';

class ProductsScreen extends StatefulWidget {
  int categoryId;
  RankingModel rank;

  ProductsScreen({this.categoryId, this.rank});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBarWidget(
              showCart: true,
              showBack: true,
            ),
            if (widget.rank != null)
              Container(
                color: Utils.primaryColor,
                width: double.maxFinite,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  widget.rank.ranking,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              ),
            FutureBuilder(
              future: _bloc.getProducts(catId: widget.categoryId, rank: widget.rank),
              builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
                final items = snapshot.data;

                return items != null
                    ? Flexible(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return new Card(
                              child: InkWell(
                                onTap: () {
                                  openProductDetails(items[index]);
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Center(
                                        child: Text(
                                          items[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Utils.primaryColor,
                                              fontFamily: "nunito",
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  openProductDetails(ProductModel prod) {
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => new ProductDetailsScreen(prod)),
      (Route<dynamic> route) => true,
    );
  }
}
