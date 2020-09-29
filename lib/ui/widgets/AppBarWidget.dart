import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_product/Utils.dart';
import 'package:your_product/ui/RankingChooserScreen.dart';

class AppBarWidget extends StatelessWidget {
  bool showBack;
  bool showCart;
  bool showFilter;

  AppBarWidget({this.showBack = false, this.showCart = false, this.showFilter = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black54, blurRadius: 3.0, offset: Offset(0.0, 0.75))],
          color: Colors.white),
      child: Row(
        children: <Widget>[
          if (showBack)
            InkWell(onTap: (){
              Navigator.pop(context);
            },
              child: Icon(
                Icons.arrow_back_ios,
                color: Utils.primaryColor,
                size: 20,
              ),
            ),
          if (showBack)
            SizedBox(
              width: 10,
            ),
          Expanded(
            child: Text(
              "YourShop",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Utils.primaryColor,
                  fontFamily: "lg",
                  decoration: TextDecoration.none),
            ),
          ),
          if (showCart)
            Icon(
              Icons.shopping_cart,
              color: Utils.primaryColor,
              size: 30,
            ),
          if (showFilter)
            SizedBox(
              width: 20,
            ),
          if (showFilter)
            InkWell(
              onTap: (){
                openFilter(context);
              },
              child: Icon(
                Icons.filter_list,
                color: Utils.primaryColor,
                size: 30,
              ),
            )
        ],
      ),
    );
  }
  openFilter(BuildContext context){
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => new RankingChooserScreen()),
          (Route<dynamic> route) => true,
    );
  }
}
