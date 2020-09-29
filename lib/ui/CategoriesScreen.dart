import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:your_product/Utils.dart';
import 'package:your_product/bloc/BlocProvider.dart';
import 'package:your_product/bloc/ProductsBloc.dart';
import 'package:your_product/hive/models/CategoryModel.dart';
import 'package:your_product/ui/ProductsScreen.dart';
import 'package:your_product/ui/RankingChooserScreen.dart';
import 'package:your_product/ui/widgets/AppBarWidget.dart';

class CategoriesScreen extends StatefulWidget {
  CategoryModel catModel;

  CategoriesScreen(this.catModel);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Box _categoryBox;
  List<CategoryModel> categoryList;

  List colors = [Color(0xffffcccb), Color(0xFFf8ffd7), Color(0xFFb4ffff), Color(0xFFe2f1f8), Color(0xFFffddc1)];
  Random random = new Random();
  ProductsBloc _bloc;

  @override
  Future<void> initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppBarWidget(showCart: true,showBack: widget.catModel!=null, showFilter:  widget.catModel==null,),
          FutureBuilder(
            future: _bloc.getCategories(widget.catModel),
            builder: (context, AsyncSnapshot<List<CategoryModel>> snapshot) {
              // print("Length of data "+snapshot.data.length.toString());
              return snapshot.data != null
                  ? snapshot.data.length > 0
                      ? Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                CategoryModel item = snapshot.data[index];
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        openNext(item);
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(vertical: 5),
                                        color: colors[random.nextInt(5)],
                                        child: Center(
                                          child: Text(
                                            item.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Utils.primaryColor,
                                                fontFamily: "overlock",
                                                decoration: TextDecoration.none),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 40),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      : Text("adf")
                  : Text("ABC");
            },
          ),
        ],
      ),
    ));
  }

  openNext(CategoryModel cat) {
    if (cat.child_categories.length > 0) {
      Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new CategoriesScreen(cat)),
        (Route<dynamic> route) => true,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new ProductsScreen(categoryId: cat.id,)),
        (Route<dynamic> route) => true,
      );
    }
  }


}
