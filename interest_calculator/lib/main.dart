import 'package:flutter/material.dart';

void main() {

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Interest Calculator",
      home: InterestCalculatorHome(),
      theme: ThemeData(
        primaryColor: Colors.green
      ),
    )
  );
}


class InterestCalculatorHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _InterestCalculatorHomeState();
  }
}


class _InterestCalculatorHomeState extends State<InterestCalculatorHome> {

  final _minimumPadding = 5.0;
  final _currencies = ['Rupees','Dollars','Pounds'];
  var _selectedCurrency = 'Rupees';
  var _displayResult ='';
  // in order to identify the current instance of form field
  var _formKey = GlobalKey<FormState>();

  // controllers for extracting the data from TextField
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            
            //first element of column widget is money image
            getMoneyImage(),
            // Text field for getting principal amount
            Padding(
              padding: EdgeInsets.only(top:_minimumPadding , bottom: _minimumPadding *2, right: _minimumPadding *5, left:_minimumPadding *5),
              child:TextFormField(
              validator: (String value){
                if(value.isEmpty){
                  return "Please enter Principal amount.";
                }
              },
              keyboardType: TextInputType.number,
              controller: principalController,
              decoration: InputDecoration(
                labelText: "Principal",
                hintText: "Enter principal. e.g.1200"
              ),
            ),
            ),

            // Text field for getting interest rate
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding , bottom: _minimumPadding, right: _minimumPadding *5, left: _minimumPadding *5),
              child: TextFormField(
                validator: (String value){
                  if(value.isEmpty){
                    return "Please enter Interest Rate.";
                  }
                },
                keyboardType: TextInputType.number,
                controller: roiController,
                decoration: InputDecoration(
                  labelText: "Interest Rate",
                  hintText: "Enter interest rate. e.g 4.3"
                ),
              ),
              ),

              // Next element row with TextInput and DropDown
              Row(
                children: <Widget>[

                  // first element of row is textfield
                  Expanded(
                    child: Padding(
                    padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding, right: _minimumPadding*5, left: _minimumPadding*5),
                    child: TextFormField(
                      validator: (String value){
                        if(value.isEmpty){
                          return "Please enter Term.";
                        }
                      },
                      keyboardType: TextInputType.number ,
                      controller: termController,
                      decoration: InputDecoration(
                        labelText:"Term" ,
                        hintText:"Time in Years" ,
                      ),
                    ),
                  ),
                  ),
                  
                  // second element of row is dropdown
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: _minimumPadding*4, bottom:_minimumPadding, left: _minimumPadding*5, right: _minimumPadding*5) ,
                        child: DropdownButton(
                        items: _currencies.map((String currency){
                          return DropdownMenuItem<String> (
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),

                        value: _selectedCurrency,
                        onChanged: (String selectedCurrency){
                            this.setState((){
                              this._selectedCurrency = selectedCurrency;
                            } 
                            );
                        },
                      ),
                        ),
                  ),
                  
                ],
              ),

              // Fourth element of column Row with two button inside
              Padding(
                padding: EdgeInsets.only(top: _minimumPadding*5 ,bottom: _minimumPadding*2 , right:_minimumPadding*5 , left: _minimumPadding*5),
                child: Row(
                children: <Widget>[

                  Expanded(
                    child: RaisedButton(
                      color: Colors.blue,
                      padding: EdgeInsets.all(_minimumPadding*3),
                      child: Text("Calculate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      ),),
                      onPressed: () {
                        setState(() {
                          if(_formKey.currentState.validate()){
                          _displayResult = calculateInterest();
                          }        
                        });
                      },
                    ),
                  ),
                  Container(width: _minimumPadding*5,),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      padding: EdgeInsets.all(_minimumPadding*3),
                      child: Text("Clear",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      ),),
                      onPressed: () {
                        setState(() {
                          this.clearInputs();
                        });
                      },
                    ),
                  )
                ],
              ) ,),

              // Last element to display calculated interest
              Padding(
                padding: EdgeInsets.all( _minimumPadding * 3),
                child: Text(_displayResult,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 20.0
                 ),),
              )
         
          ],
        ),
      ),
    );
  }

  // return image widget of money
  Widget getMoneyImage() {
    AssetImage moneyAsset = AssetImage('images/money.png');
    Image moneyImage = Image(image: moneyAsset,width: 125.0,height: 125.0,);

    return Container(child: moneyImage, padding: EdgeInsets.all(_minimumPadding*5) ,);
  }

  // calculate interest
  String calculateInterest() {

    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmount = principal + (principal * roi * term)/100;

    return 'After $term years, your investment will be worth of total $totalAmount $_selectedCurrency';
  }

  // clear input fields
  void clearInputs() {
    principalController.text = '';
    roiController.text ='';
    termController.text = '';
    _selectedCurrency = _currencies[0];
    _displayResult = '';
  }

}