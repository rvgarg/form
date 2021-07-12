import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _state = '';
  var _name = '';
  var _line1 = '';
  var _line2 = '';
  var _pincode = '';
  var _district = '';
  var gender = '';
  var done = false;
  final _controlern = TextEditingController(),
      _controler1 = TextEditingController(),
      _controler2 = TextEditingController(),
      _controlerp = TextEditingController();

  final _form = GlobalKey<FormState>();

  void _submit() {
    final valid = _form.currentState!.validate();
    if (valid) {
      Toast.show("Validation Passed!!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      setState(() {
        _name = _controlern.text;
        _line1 = _controler1.text;
        _line2 = _controler2.text;
        _pincode = _controlerp.text;
        done = true;
      });
    }
  }

  Widget getBody(bool done) {
    if (!done) {
      return Stack(children: [
        Align(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Form(
              key: _form,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                      ),
                      validator: (text) {
                        if (!text!.isNotEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      controller: _controlern,
                    ),
                    TextFormField(
                      controller: _controler1,
                      decoration: InputDecoration(
                        labelText: 'Line 1',
                      ),
                      validator: (text) {
                        if (!text!.isNotEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _controler2,
                      decoration: InputDecoration(
                        labelText: 'Line 2',
                      ),
                      validator: (text) {
                        if (!text!.isNotEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField(
                        value: _state,
                        onChanged: (String? newValue) {
                          setState(() {
                            _state = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == "") {
                            return "This field is required";
                          }
                          return null;
                        },
                        items: <String>[
                          "",
                          "Haryana",
                          "Punjab",
                          "Delhi",
                          "Rajasthan"
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                    DropdownButtonFormField(
                        value: _district,
                        onChanged: (String? newValue) {
                          setState(() {
                            _district = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == "") {
                            return "This field is required";
                          }
                          return null;
                        },
                        items: <String>[
                          "",
                          "Sonipat",
                          "Panipat",
                          "NewDelhi",
                          "Jaipur",
                          "Kota",
                          "Gurugram"
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                    TextFormField(
                        controller: _controlerp,
                        decoration: InputDecoration(
                          labelText: 'PIN Code',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (text) {
                          if (!text!.isNotEmpty) {
                            return "This field is required";
                          }
                          return null;
                        }),
                    RadioListTile(
                      groupValue: gender,
                      value: 'female',
                      title: Text('female'),
                      onChanged: (val) {
                        setState(() {
                          gender = val.toString();
                        });
                      },
                    ),
                    RadioListTile(
                        value: 'male',
                        title: Text('male'),
                        groupValue: gender,
                        onChanged: (val) {
                          setState(() {
                            gender = val.toString();
                          });
                        })
                  ]),
            ),
          ),
          alignment: Alignment.topCenter,
        ),
        Align(
          child: Padding(
              child: SizedBox(
                child: MaterialButton(
                  onPressed: _submit,
                  child: Text(
                    'DONE',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                width: double.infinity,
              ),
              padding: EdgeInsets.all(10.0)),
          alignment: Alignment.bottomCenter,
        )
      ]);
    } else {
      return Center(
          child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    "Full name: $_name",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Address line 1: $_line1",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  Text("Address line 2: $_line2",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  Text("State: $_state",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  Text("District: $_district",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  Text("Pincode: $_pincode",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  Text("Gender: $gender",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                ],
              )));
    }
  }

  @override
  void dispose() {
    _controler1.dispose();
    _controler2.dispose();
    _controlern.dispose();
    _controlerp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getBody(done),
    );
  }
}
