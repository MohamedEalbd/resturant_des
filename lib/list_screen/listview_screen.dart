import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturant_des/list_screen/addeditscreen.dart';
import 'package:resturant_des/list_screen/purchasebasket_screen.dart';
import 'package:resturant_des/resturantmethod/method.dart';

class ListViewScreen extends StatefulWidget {

  @override
  ListViewScreenState createState() =>  ListViewScreenState();
}

class ListViewScreenState extends State<ListViewScreen>  {
  static  ListViewScreenState ls;
  List foods = new List();
  void reffreshScreen(){
    ResturantMethod.GetAllFood().then((value){
      setState(() {
        foods = value;
        ls=this;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reffreshScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
      ),
      body: Column(
      children: <Widget>[
        new Expanded(
            child: ListView.builder(
                 itemCount: foods.length,
                itemBuilder: (BuildContext context , int postition){
              return ListTile(
                title: Text("Name : ${foods[postition]["name"]}") ,
                subtitle: Text("${foods[postition]["desprection"]}   " +
                    "Price : ${foods[postition]["price"]}"),
                leading: CircleAvatar(
                  child: Image.asset("${foods[postition]["img"]}"),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.delete),
                        onPressed: (){
                      ResturantMethod.deleteFood(foods[postition]["id"]);
                      reffreshScreen();
                        }),
                    IconButton(icon: Icon(Icons.edit),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  AddEditScreen("Edit",
                                      foods[postition]["id"],
                                      "${foods[postition]["name"]}",
                                      "${foods[postition]["desprection"]}",
                                      "${foods[postition]["price"]}")
                              )
                          );
                          reffreshScreen();
                        }),
                    IconButton(icon: Icon(Icons.shopping_cart),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  BurchaseBasketScreen(foods[postition]["id"], "${foods[postition]["name"]}",
                                    "${foods[postition]["desprection"]}",)
                              )
                          );
                          reffreshScreen();
                        }),
                  ],
                ),
              );
            }) 
        
        ),
      ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddEditScreen("Add",0,"","","")
                )
            );
          }),
    );
  }
}
