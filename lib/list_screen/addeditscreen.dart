import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resturant_des/list_screen/listview_screen.dart';
import 'package:resturant_des/model/resturant.dart';
import 'package:resturant_des/resturantmethod/method.dart';

class AddEditScreen extends StatefulWidget {
  String command;
  int id ;
  String nameFood;
  String deptFood;
  String priceFood;

  AddEditScreen(this.command,this.id, this.nameFood, this.deptFood, this.priceFood);

  @override
  _AddEditScreenState createState() => _AddEditScreenState(this.command,this.id, this.nameFood, this.deptFood, this.priceFood);
}

class _AddEditScreenState extends State<AddEditScreen> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _deptController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();

  String command;
  int id;
  String nameFood;
  String deptFood;
  String priceFood;
  String image = "assets/images/ds.jpg";


  _AddEditScreenState(this.command,this.id, this.nameFood, this.deptFood, this.priceFood);
  @override
  Widget build(BuildContext context) {
    String str = "";
    if(command == 'Add'){
       str = "Add";
    }
    else{
      str = "Edit";
      _nameController.text = nameFood;
      _deptController.text = deptFood;
      _priceController.text = priceFood;
    }
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: ListView(
          children: <Widget>[
      Padding(
      padding: EdgeInsets.only( top: 15, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {

            },

          ),
          Container(
            width: 125,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list),
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {

                  },

                ),
              ],
            ),
          )
        ],
      ),
    ),
        SizedBox(height: 27,),
         Padding(
            padding: EdgeInsets.only(left: 40),
           child: Row(
             children: <Widget>[
             Text("Restaurant",
             style: TextStyle(
    // fontFamily:'SourceSerifPro',
               color: Colors.white,
    // fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
           SizedBox(width: 10.0,),
            Text("Food",
           style: TextStyle(
            fontFamily:'SourceSerifPro',
             color: Colors.white,
           fontSize: 25,
            ),
            )
             ],
           ),
        ),
       SizedBox(height: 40.0,),
        // Padding(padding: EdgeInsets.only(top: 40.0)),
            Container(
              height: MediaQuery.of(context).size.height - 185,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
              ),
               child: Column(
                 children: <Widget>[
                   SizedBox(height: 10.0,),
                   Container(
                     child: Image.asset(image ,
                     width: MediaQuery.of(context).size.width * .5,
                     ),
                   ),
                   SizedBox(height: 10.0,),
                   Container(
                     width: MediaQuery.of(context).size.width * .85,
                     child: TextField(
                       controller: _nameController,
                       decoration: InputDecoration(
                         labelText: 'name',
                         hintText: 'Name',
                       ),
                     ),
                   ),
                   SizedBox(height: 15.0,),
                   Container(
                     width: MediaQuery.of(context).size.width * .85,
                     child: TextField(
                       controller: _deptController,
                       decoration: InputDecoration(
                         labelText: 'Descreption',
                         hintText: 'Enter Your Descreption',
                       ),
                     ),
                   ),
                   SizedBox(height: 10.0,),
                   Container(
                     width: MediaQuery.of(context).size.width * .85,
                     child: TextField(
                       controller: _priceController,
                       keyboardType: TextInputType.number,
                       inputFormatters: <TextInputFormatter>[
                         WhitelistingTextInputFormatter.digitsOnly
                       ],
                       decoration: InputDecoration(
                         labelText: 'Enter Your Price',
                         hintText: 'Price',
                       ),
                     ),
                   ),
                   new Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       RaisedButton(
                           child: Text(str),
                           onPressed: (){
                             if(_nameController.text.length > 0 &&
                                 _deptController.text.length>0 &&
                                 _priceController.text.length >0){
                               if(command == "Add"){
                                 ResturantMethod.AddFood(
                                     Resturant(0, image, _nameController.text, _deptController.text, _priceController.text));
                                 _nameController.text = "";
                                 _deptController.text = "";
                                 _priceController.text = "";
                               }
                               else{
                                 ResturantMethod.EditFood(
                                     Resturant(id,image, _nameController.text, _deptController.text, _priceController.text)
                                 );
                               }
                               Navigator.pop(context);
                               ListViewScreenState.ls.reffreshScreen();
                             }
                           }
                       ),
                       RaisedButton(
                           child:Text("Buy"),
                           onPressed: (){
                            ResturantMethod.getBuyFood();
                             Navigator.pop(context);
                           })
                       //new RaisedButton(onPressed: null)
                     ],
                   )
                 ],
               )
            ),
           // SizedBox(height: 40.0,),
            
       ]),
    );
  }
}
