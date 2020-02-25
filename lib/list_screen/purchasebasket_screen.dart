import 'package:flutter/material.dart';
import 'package:resturant_des/resturantmethod/method.dart';
class BurchaseBasketScreen extends StatefulWidget {
  List foods = new List();
  String command;
  int id ;
  String nameFood;
  String priceFood;

  BurchaseBasketScreen(this.id, this.nameFood, this.priceFood);

  @override
  _BurchaseBasketScreenState createState() => _BurchaseBasketScreenState(
      this.id, this.nameFood, this.priceFood);
}

class _BurchaseBasketScreenState extends State<BurchaseBasketScreen> {
  List foods = new List();
  String command;
  int id;
  String nameFood;
  String priceFood;
  String image = "assets/images/ds.jpg";


  _BurchaseBasketScreenState(this.id, this.nameFood, this.priceFood);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }

  void reffreshScreen(){
    ResturantMethod.GetAllFood().then((value){
      setState(() {
        foods = value;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reffreshScreen();
  }
  TextEditingController _numController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
        title: Text('burchasebasket'),
    ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: foods.length,

                  itemBuilder: (BuildContext context , int postition){
                    return ListTile(

                        title: Text("Name : ${foods[postition]["name"]}") ,
                      subtitle: Text("Price : ${foods[postition]["price"]}"),
                      leading: CircleAvatar(
                         child: Image.asset("${foods[postition]["img"]}"),
                      ),

                      onTap: (){
                        showInSnackBar("Your Chosie ${foods[postition]["name"]} "
                            "Price : ${foods[postition]["price"] * _numController.value} ");
                      },
                    );
                  }
                  )
          )
        ],
      ),
    );
  }
}
