import 'package:cathy_laundry_app/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './home.dart';
import './create_account.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  
  String _username;
  String _email;
  String _phoneNumber;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget _buildEmailField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.deepPurpleAccent, width: 1.8)
        ),
        labelText:'Email', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Email Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        _email = value;
      },
    );
  }

    Widget _buildPasswordField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.deepPurpleAccent, width: 1.8)
        ),
        labelText:'Password', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Password Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        _email = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey[200],
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: Colors.deepPurpleAccent.withOpacity(0.65),),
          color: Colors.white, 
          onPressed: () {
            Navigator.pop(context);
          },tooltip: "back",
        ),
      ),

      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft ,
              colors: [Colors.lightGreen[100], Colors.deepPurpleAccent.withOpacity(0.55)]),
            ),
            
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: ListView(
                children: <Widget>[
                  Form(
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildEmailField(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildPasswordField(),
                        ),
                        SizedBox(height:40.0),
                        GestureDetector(
                        onTap: (){
                          Navigator.push(context, PageTransition( type: PageTransitionType.fade , child: LandingPage()));
                        },
                        child:Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.8),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(
                          child: Text("Log In", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white))
                          ),
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text("FORGOT PASSWO?", textAlign: TextAlign.start, style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700 ),),
                            SizedBox(width: 30.0),

                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, PageTransition( type: PageTransitionType.fade , child: CreateAccount()));
                              },
                              child: Text("JOIN NOW", textAlign: TextAlign.right, style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700 ),),
                            )
                          ]
                        ),
                      )
                    ],
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.conicTo(400, 700, size.width + 500, -5.0, 1);
    //path.lineTo(0.0, size.height / 2);
    //path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}