import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: 2,
                    color: Color(0xFF3096D6),
                  ),
                  Expanded(
                    child: Divider(height: 1, color: Color(0xFFC9C9C9)),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(
                            child: TextInput("First Name", text: "Peter"),
                          ),
                          VerticalDivider(width: 1, color: Color(0xFFC9C9C9)),
                          Flexible(
                            child: TextInput("Last Name", text: "Parker"),
                          ),
                        ],
                      ),
                    ),
                    TextInput("Middle Name", text: "Ben"),
                    TextInput("Date of Birth", text: "June 6, 1980"),
                    RadioInput("Sex", {
                      'Male': Sex.male,
                      'Female': Sex.female,
                      'Other': Sex.other,
                    }),
                    TextInput(
                      "Social Security Number (SSN)",
                      text: "XXX-XX-XXXX",
                      secure: true,
                    ),
                    AddressInput(),
                    TextInput(
                      "Phone Number",
                      text: "(904) 555-1234",
                      phone: true,
                    ),
                    TextInput("Email (optional)", text: "parker.p@gmail.com"),
                    ListHeader("EMERGENCY CONTACT"),
                    TextInput("Emergency Contact Name", text: "Ned Leeds"),
                    TextInput(
                      "Emergency Contact Phone Number",
                      text: "(904) 555-1235",
                      phone: true,
                    ),
                    TextInput(
                      "Relationship to Emergency Contact",
                      text: "Brother",
                    ),
                    ListHeader("DEMOGRAPHICS"),
                    RadioInput("Race", {
                      'African-America': Race.africanAmerican,
                      'Asian': Race.asian,
                      'Hispanic': Race.hispanic,
                      'Native American': Race.nativeAmerican,
                      'White': Race.white,
                      'Other': Race.other,
                    }),
                    RadioInput("Ethnicity", {
                      'American Indian or Alaskan Native': Ethnicity.native,
                      'Asian': Ethnicity.asian,
                      'Black or African American': Ethnicity.black,
                      'Hispanic or Latino': Ethnicity.hispanic,
                      'Native Hawaiian or Other Pacific Islander':
                          Ethnicity.pacific,
                      'White': Ethnicity.white,
                    }),
                    RadioInput("Marital Status", {
                      'Married': Marital.married,
                      'Single': Marital.single,
                      'Divorced': Marital.divorced,
                      'Separated': Marital.separated,
                      'Widowed': Marital.widowed,
                      'Partnered': Marital.partnered,
                    }),
                    SliderInput("Gross Annual Income"),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InsuranceScreen(),
                          ),
                        ),
                        color: Color(0xFF3096D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(13.0),
                          child: Text(
                            "Next Step: Billing & Insurance",
                            style: new TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Open Sans",
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ), //
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InsuranceScreen extends StatelessWidget {
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
                          'Billing & Insurance',
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Let the clinic know your insurance plan.',
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
                    width: MediaQuery.of(context).size.width * 0.66,
                    height: 2,
                    color: Color(0xFF3096D6),
                  ),
                  Expanded(
                    child: Divider(height: 1, color: Color(0xFFC9C9C9)),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    new TextInput(
                      "Insurance Company Name",
                      text: "Florida Blue",
                    ),
                    new TextInput(
                      "Insurance Company Phone Number",
                      text: "(904) 555-1236",
                      phone: true,
                    ),
                    new TextInput(
                      "Policy Holder First Name",
                      text: "Peter",
                    ),
                    new TextInput(
                      "Policy Holder Last Name",
                      text: "Parker",
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(
                            child: new TextInput("Policy Number", text: "1234"),
                          ),
                          VerticalDivider(width: 1, color: Color(0xFFC9C9C9)),
                          Flexible(
                            child: new TextInput("Group Number", text: "5432"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: RaisedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MedicalHistoryScreen(),
                          ),
                        ),
                        color: Color(0xFF3096D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(13.0),
                          child: Text(
                            "Next Step: Medical History",
                            style: new TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Open Sans",
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ), //
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicalHistoryScreen extends StatelessWidget {
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
                          'Medical History',
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Descibe your allergies and medical history.',
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
                    width: MediaQuery.of(context).size.width * 1,
                    height: 2,
                    color: Color(0xFF3096D6),
                  ),
                  Expanded(
                    child: Divider(height: 1, color: Color(0xFFC9C9C9)),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 16.0),
                    DetailListInput(
                      title: "Allergies",
                      subtitle:
                          "List any medications, food, etc. you are allergic to",
                      children: [
                        SizedBox(height: 10.0),
                        DetailCard(
                          title: "Peanut",
                          subtitle: "Strong reaction",
                        ),
                        SizedBox(height: 10.0),
                        DetailCard(
                          title: "Vitamin D",
                          subtitle: "Mild reaction",
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    DetailListInput(
                      title: "Medications",
                      subtitle: "List all the medications you are taking",
                      children: [
                        SizedBox(height: 10.0),
                        DetailCard(
                          title: "Aspirin",
                          subtitle: "10mg",
                          caption: "2 tablets twice daily",
                        ),
                        SizedBox(height: 10.0),
                        DetailCard(
                          title: "Vitamin B",
                          subtitle: "10mg",
                          caption: "1 tablet once daily",
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Immunizations',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Year',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Color(0xFFA1A1A1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1, color: Color(0xFFC9C9C9)),
                    YearInput(title: 'Chicken Pox', year: '1998'),
                    YearInput(title: 'Hepatitis A', year: '1989'),
                    YearInput(
                      title: 'MMR (Measles, Mumps, Rubella)',
                      year: '2001',
                    ),
                    SizedBox(height: 32.0),
                    DetailListInput(
                      title: 'Conditions',
                      subtitle:
                          'List any conditions you have or have had in the past',
                      noIcon: true,
                      children: [
                        SearchBar(
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                        ),
                        SizedBox(height: 12.0),
                        ConditionsInput(),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: RaisedButton(
                        onPressed: () => {},
                        color: Color(0xFF3096D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(13.0),
                          child: Text(
                            "Next Step: Symptoms",
                            style: new TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Open Sans",
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    @required this.controller,
    @required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
              color: Color(0xFF8E8E8E),
            ),
            Expanded(
              child: CupertinoTextField(
                decoration: BoxDecoration(border: null),
                controller: controller,
                focusNode: focusNode,
                placeholder: "Search",
                placeholderStyle: TextStyle(
                  color: Color(0xFFC9C9C9),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConditionsInput extends StatefulWidget {
  @override
  State createState() => ConditionsInputState();
}

class ConditionsInputState extends State<ConditionsInput> {
  static const List<String> _conditions = [
    "Anxiety Disorder",
    "Arthritis",
    "Athsma",
    "Blood Clots",
    "Cancer",
    "Claustrophobia",
    "Diabetes",
    "Dialysis",
    "Heart Attack",
    "High Blood Pressure",
    "Overactive Thyroid",
    "Liver Disease",
    "Stroke",
    "Tuberculosis"
  ];

  final List<String> _selected = [
    "Arthritis",
    "Heart Attack",
    "Liver Disease",
  ];

  void _handleOnSelected(String condition) {
    setState(() => _selected.contains(condition)
        ? _selected.remove(condition)
        : _selected.add(condition));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        chipTheme: Theme.of(context).chipTheme.copyWith(
              secondarySelectedColor: Color(0xFF3096D6),
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              labelStyle: TextStyle(color: Color(0xFF626262), fontSize: 15.0),
              secondaryLabelStyle: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
      ),
      child: Wrap(
        spacing: 8.0,
        children: [
          for (var choice in _conditions)
            ChoiceChip(
              label: Text(choice),
              selected: _selected.contains(choice),
              onSelected: (selected) => _handleOnSelected(choice),
              shape: StadiumBorder(
                side: BorderSide(
                  color: _selected.contains(choice)
                      ? Color(0xFF3096D6)
                      : Color(0xFFCECECE),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class YearInput extends StatelessWidget {
  final String title;
  final String year;

  const YearInput({
    Key key,
    @required this.title,
    @required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE9E9E9),
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 13.0,
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          VerticalDivider(width: 1, color: Color(0xFFC9C9C9)),
          Expanded(
            flex: 1,
            child: TextInput(
              null,
              text: year,
              centered: true,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailListInput extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final String subtitle;
  final bool noIcon;

  DetailListInput({
    @required this.title,
    @required this.subtitle,
    this.noIcon = true,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Color(0xFF929292),
                          fontSize: 15.0,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!noIcon)
                  Padding(
                    padding: EdgeInsets.only(right: 2.0),
                    child: Icon(
                      FontAwesomeIcons.plusCircle,
                      size: 24.0,
                      color: Color(0xFF3096D6),
                    ),
                  ),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String caption;

  const DetailCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    letterSpacing: -0.41,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(width: 14.0),
                Expanded(
                  child: Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      letterSpacing: -0.41,
                      color: Color(0xFF50555C),
                      fontSize: 15.0,
                      height: 1.3,
                    ),
                  ),
                ),
                Icon(
                  FontAwesomeIcons.pen,
                  size: 14.0,
                  color: Color(0xFF929292),
                ),
              ],
            ),
            if (caption != null)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      caption,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: -0.41,
                        color: Color(0xFF50555C),
                        fontWeight: FontWeight.w300,
                        fontSize: 15.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  final String title;

  const ListHeader(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0F0F0),
      padding: EdgeInsets.all(20),
      alignment: AlignmentDirectional.center,
      child: Text(
        title,
        style: TextStyle(color: Color(0xFF929292)),
      ),
    );
  }
}

class AddressInput extends StatelessWidget {
  const AddressInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Address',
            style: Theme.of(context).textTheme.subhead.copyWith(
                  color: Color(0xFF888888),
                  fontSize: 12.0,
                  height: 0.8,
                ),
          ),
          SizedBox(height: 10.0),
          Card(
            elevation: 3.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '814 Lasalle St.',
                    style: TextStyle(
                      letterSpacing: -0.41,
                      fontSize: 17.0,
                    ),
                  ),
                  Text(
                    'Jacksonville, Florida 32207',
                    style: TextStyle(
                      letterSpacing: -0.41,
                      color: Color(0xFF50555C),
                      fontSize: 15.0,
                      height: 1.3,
                    ),
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

class SliderInput extends StatefulWidget {
  final String label;

  SliderInput(this.label);

  @override
  State createState() => SliderInputState();
}

class SliderInputState extends State<SliderInput> {
  double _sliderValue = 125000.0;

  void _handleSliderChange(double value) {
    setState(() => _sliderValue = value);
  }

  String _stringValue() {
    var income = _sliderValue.toStringAsFixed(0).replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    return _sliderValue > 0 ? "\$$income+" : "Prefer not to say";
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.subhead.copyWith(
          color: Color(0xFF888888),
          fontSize: 12.0,
          height: 0.8,
        );

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.label,
                  style: labelStyle,
                ),
                SizedBox(height: 8.0),
                Text(
                  _stringValue(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Slider(
            min: 0,
            max: 250000,
            divisions: 10,
            onChanged: _handleSliderChange,
            value: _sliderValue,
          )
        ],
      ),
    );
  }
}

enum Sex { male, female, other }
enum Race { africanAmerican, asian, hispanic, nativeAmerican, white, other }
enum Ethnicity { native, asian, black, hispanic, pacific, white }
enum Marital { married, single, divorced, separated, widowed, partnered }

class RadioInput extends StatefulWidget {
  final label;
  final options;

  RadioInput(this.label, this.options);

  @override
  State createState() => RadioInputState();
}

// TODO: generify, introduce static types
class RadioInputState extends State<RadioInput> {
  var _radioValue;

  void _handleRadioChange(var value) {
    setState(() => _radioValue = value);
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.subhead.copyWith(
          color: Color(0xFF888888),
          fontSize: 12.0,
          height: 0.8,
        );

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE9E9E9))),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.label,
              style: labelStyle,
            ),
          ),
          for (var name in widget.options.keys)
            // TODO: replace with a custom Radio using GestureDetector
            Container(
              height: 35.0,
              child: RadioListTile(
                title: Text(name, style: TextStyle(color: Colors.black)),
                value: widget.options[name],
                dense: false,
                groupValue: _radioValue,
                onChanged: _handleRadioChange,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
        ],
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final String label;
  final String text;
  final bool secure;
  final bool phone;
  final bool centered;

  const TextInput(
    this.label, {
    Key key,
    this.text,
    this.secure = false,
    this.phone = false,
    this.centered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secureIcon = Image.asset("assets/secureicon.png", scale: 4);
    final labelColor = secure ? Color(0xFF3096D6) : Color(0xFF888888);
    final textColor = secure ? Color(0xFF3096D6) : Colors.black;

    final textField = TextField(
      textAlign: centered ? TextAlign.center : TextAlign.start,
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
        prefixText: phone ? "🇺🇸  " : null,
        prefixStyle: TextStyle(color: Colors.black),
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
