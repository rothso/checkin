import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
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
        textTheme: textTheme.copyWith(
            headline: textTheme.headline.copyWith(
              fontFamily: 'Jura',
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
            ),
            caption: textTheme.caption.copyWith(
              fontWeight: FontWeight.w300,
            )),
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
              builder: (context) => SecondRoute(),
            ),
          ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/trifidmedwhite.png', scale: 1.5),
              SizedBox(height: 8.0),
              Text(
                'Trifid Med',
                style: Theme.of(context).textTheme.headline,
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

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}
