import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './login.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String _username;
  String _email;
  String _phoneNumber;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1.8)),
        labelText: 'Email',
        labelStyle: TextStyle(
            fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w600),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email Required';
        }
      },
      //set state on saved
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.deepPurpleAccent, width: 1.8)),
          labelText: 'Phone Number',
          labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontWeight: FontWeight.w600)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Required';
        }
      },

      //set state on saved
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.deepPurpleAccent, width: 1.8)),
          labelText: 'Password',
          labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontWeight: FontWeight.w600)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password Required';
        }
      },

      //set state on saved
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.deepPurpleAccent.withOpacity(0.65),
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: "back",
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.lightGreen[100],
                    Colors.deepPurpleAccent.withOpacity(0.55)
                  ]),
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
                        child: _buildPhoneNumberField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildPasswordField(),
                      ),
                      SizedBox(height: 40.0),
                      GestureDetector(
                        onTap: () {
                          //code here
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 1.8),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text("Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(children: [
                          Text(
                            "ALREADY HAVE AN ACCOUNT?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: Login()));
                            },
                            child: Text(
                              "LOG IN",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ]),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
