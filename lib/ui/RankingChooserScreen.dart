import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_product/Utils.dart';
import 'package:your_product/bloc/BlocProvider.dart';
import 'package:your_product/bloc/ProductsBloc.dart';
import 'package:your_product/hive/models/ProductModel.dart';
import 'package:your_product/hive/models/RankingModel.dart';
import 'package:your_product/ui/ProductDetailsScreen.dart';
import 'package:your_product/ui/ProductsScreen.dart';
import 'package:your_product/ui/widgets/AppBarWidget.dart';

class RankingChooserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsBloc _bloc= BlocProvider.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    "Choose Filter...",
                    style: TextStyle(fontSize: 28, fontFamily: 'nunito', fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear,
                      size: 26,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Utils.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder<List<RankingModel>>(
                future: _bloc.getRankingList(),
                builder: (context, snapshot) {

                  return snapshot.data!=null?ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                            onPressed: () {
                              openProductListWithFilter(snapshot.data[index] ,context  );
                            }
                            ,
                            child: Text(
                              snapshot.data[index].ranking,
                              style: TextStyle(fontSize: 20, color: Utils.primaryColor),
                            )),
                      ),
                    ),
                    itemCount: snapshot.data.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Utils.primaryColor,
                    ),
                  ):Container();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
  openProductListWithFilter(RankingModel rank,BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ProductsScreen(rank:rank,)));

  }
}



