import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: textTheme.copyWith(
          display2: textTheme.display2.copyWith(
            fontFamily: 'Jura',
            fontWeight: FontWeight.w600,
            fontSize: 30.0,
          ),
          display1: textTheme.display1.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
            color: Colors.black,
          ),
          title: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
          ),
          caption: textTheme.caption.copyWith(
            fontSize: 15.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return GestureDetector(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClinicCodeScreen(),
            ),
          ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/trifidmedwhite.png', scale: 1.5),
              SizedBox(height: 12.0),
              Text(
                'Trifid Med',
                style: Theme.of(context).textTheme.display2.copyWith(
                      color: Color(0xFF000000),
                    ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Patient check-in, simplified.',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: Center(
    //     child: Container(
    //       color: Colors.white,
    //       alignment: AlignmentDirectional(0.0, -0.7),
    //       child: Container(
    //         margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 40.0),
    //         child: Column(children: [
    //           Image.asset("assets/hospital.png", scale: 3),
    //           SizedBox(height: 40.0),
    //           RichText(
    //             text: TextSpan(
    //               // Note: Styles for TextSpans must be explicitly defined.
    //               // Child text spans will inherit styles from parent
    //               style: TextStyle(fontSize: 12.0, color: Color(0xFF666666)),
    //               children: [
    //                 TextSpan(
    //                   text: 'You are checking into ',
    //                   style: TextStyle(fontStyle: FontStyle.italic),
    //                 ),
    //                 TextSpan(
    //                   text: 'West Haven Clinic',
    //                   style: TextStyle(fontWeight: FontWeight.w500),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(height: 15.0),
    //           Container(
    //             decoration: BoxDecoration(
    //               color: Color(0xFF3096D6),
    //               borderRadius: BorderRadius.circular(50.0),
    //             ),
    //             padding: EdgeInsets.all(10.0),
    //             child: Center(
    //               child: Text(
    //                 "7HAT46",
    //                 style: new TextStyle(
    //                   color: Colors.white,
    //                   letterSpacing: 6.0,
    //                   decoration: TextDecoration.none,
    //                   fontWeight: FontWeight.normal,
    //                   fontFamily: "Jura",
    //                   fontSize: 25,
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 35.0),
    //           Text(
    //             "Who is the appointment for?",
    //             style: TextStyle(
    //               fontSize: 12.0,
    //               color: Color(0xFF666666),
    //               decoration: TextDecoration.none,
    //               fontStyle: FontStyle.italic,
    //               fontFamily: "Open Sans",
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //           SizedBox(height: 20.0),
    //           Container(
    //             margin: EdgeInsets.symmetric(horizontal: 20.0),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: List.generate(
    //                 3,
    //                 (index) => Expanded(
    //                       child: Column(
    //                         children: [
    //                           Container(
    //                             decoration: BoxDecoration(
    //                               color: Color(0xFFC4C4C4),
    //                               shape: BoxShape.circle,
    //                             ),
    //                             child: SizedBox(width: 60, height: 60),
    //                           ),
    //                           SizedBox(height: 15),
    //                           Text(
    //                             "Johnathan",
    //                             style: TextStyle(
    //                               fontSize: 12.0,
    //                               color: Color(0xFF000000),
    //                               decoration: TextDecoration.none,
    //                               fontFamily: "Open Sans",
    //                               fontWeight: FontWeight.normal,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 10.0),
    //           RaisedButton(
    //             onPressed: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => SecondRoute()),
    //               );
    //             },
    //             color: Color(0xFF343434),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: new BorderRadius.circular(50.0),
    //             ),
    //             child: Center(
    //               child: Text(
    //                 "This appointment is for someone new",
    //                 style: new TextStyle(
    //                   color: Colors.white,
    //                   decoration: TextDecoration.none,
    //                   fontWeight: FontWeight.w300,
    //                   fontFamily: "Open Sans",
    //                   fontSize: 12,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ]),
    //       ),
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   appBar: AppBar(
    //     // Here we take the value from the MyHomePage object that was created by
    //     // the App.build method, and use it to set our appbar title.
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //     // Center is a layout widget. It takes a single child and positions it
    //     // in the middle of the parent.
    //     child: Column(
    //       // Column is also layout widget. It takes a list of children and
    //       // arranges them vertically. By default, it sizes itself to fit its
    //       // children horizontally, and tries to be as tall as its parent.
    //       //
    //       // Invoke "debug painting" (press "p" in the console, choose the
    //       // "Toggle Debug Paint" action from the Flutter Inspector in Android
    //       // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
    //       // to see the wireframe for each widget.
    //       //
    //       // Column has various properties to control how it sizes itself and
    //       // how it positions its children. Here we use mainAxisAlignment to
    //       // center the children vertically; the main axis here is the vertical
    //       // axis because Columns are vertical (the cross axis would be
    //       // horizontal).
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           'You have pushed the button this many times!:',
    //         ),
    //         Text(
    //           '$_counter',
    //           style: Theme.of(context).textTheme.display1,
    //         ),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}

class ClinicCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your 6-digit clinic code',
                style: Theme.of(context).textTheme.display1,
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'You can get this code by contacting your local clinic if they support the app.',
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 48.0),
              TextField(
                autocorrect: false,
                autofocus: true,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'XXXXXX',
                  hintStyle: TextStyle(
                    color: Color(0xFFCCCCCC),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Jura',
                  fontWeight: FontWeight.w600,
                  fontSize: 32.0,
                  letterSpacing: 4.0,
                ),
              ),
              SizedBox(height: 16.0),
              RaisedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalInfoScreen(),
                      ),
                    ),
                color: Color(0xFF000000),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: new TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Open Sans",
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 7,
                    child: BackButton(),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          'Personal Info',
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Let the clinic know who you are.',
                          style: TextStyle(
                            color: Color(0xFF626262),
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Row(
                children: [
                  Container(
                    width: 75,
                    height: 2,
                    color: Color(0xFF3096D6),
                  ),
                  Expanded(
                    child: Divider(height: 1, color: Color(0xFFC9C9C9)),
                  ),
                ],
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Flexible(child: new TextInput("First Name", text: "Mario")),
                    VerticalDivider(width: 1, color: Color(0xFFC9C9C9)),
                    Flexible(
                      child: new TextInput("Last Name", text: "Griffin"),
                    ),
                  ],
                ),
              ),
              TextInput("Middle Name", text: "Antonio"),
              TextInput("Date of Birth", text: "June 6, 1980"),
              SexInput(),
              TextInput("Social Security Number (SSN)",
                  text: "XXX-XX-XXXX", secure: true),
            ],
          ),
        ),
      ),
    );
  }
}

enum Sex { male, female, other }

class SexInput extends StatefulWidget {
  @override
  State createState() => SexInputState();
}

class SexInputState extends State<SexInput> {
  static const sexes = {
    'Male': Sex.male,
    'Female': Sex.female,
    'Other': Sex.other,
  };

  Sex _radioValue;

  void _handleRadioChange(Sex value) {
    setState(() => _radioValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'Sex',
            style: TextStyle(
              color: Color(0xFF888888),
              fontSize: 12.0,
              height: 0.8,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        for (var name in sexes.keys)
          // TODO: replace with a custom Radio using GestureDetector
          Container(
            height: 35.0,
            child: RadioListTile(
              title: Text(name, style: TextStyle(color: Colors.black)),
              value: sexes[name],
              dense: false,
              groupValue: _radioValue,
              onChanged: _handleRadioChange,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
      ]),
    );
  }
}

class TextInput extends StatelessWidget {
  final String label;
  final String text;
  final bool secure;

  const TextInput(
    this.label, {
    Key key,
    this.text,
    this.secure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secureIcon = Image.asset("assets/secureicon.png", scale: 4);
    final labelColor = secure ? Color(0xFF3096D6) : Color(0xFF888888);
    final textColor = secure ? Color(0xFF3096D6) : Colors.black;

    final textField = TextField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE9E9E9)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE9E9E9)),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 13.0,
        ),
      ),
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      controller: TextEditingController(text: text),
    );

    return secure
        ? Container(
            color: Color(0xFFF5FAFD),
            child: Stack(
              children: [
                textField,
                Positioned(
                  right: 10,
                  top: 0,
                  bottom: 0,
                  child: secureIcon,
                ),
              ],
            ),
          )
        : textField;
  }
}
