import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:bluescreen/styles.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:synchronized/synchronized.dart';

void main() => runApp(BlueScreen());

class BlueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Blue Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(
              display2: Styles.logoText,
              display1: Styles.headerText,
              title: Styles.appBarTitle,
              caption: Styles.captionText,
            ),
      ),
      home: ClinicCodeScreen(),
    );
  }
}

class ClinicCodeScreen extends StatefulWidget {
  @override
  ClinicCodeState createState() => ClinicCodeState();
}

class ClinicCodeState extends State<ClinicCodeScreen> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  bool submitEnabled = false;
  String clinicCode;
  String errorText;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        submitEnabled = controller.text.trim().length == 6;
      });
    });
  }

  String _validate(value) {
    setState(() {
      if (value.isEmpty) {
        errorText = 'Please enter a clinic code!';
      } else if (!RegExp(r'^[a-zA-Z\d]{6}$').hasMatch(value)) {
        errorText = 'Invalid clinic code';
      } else {
        errorText = null;
      }
    });
    return errorText == null ? null : "";
  }

  void _submit(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalInfoScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter your 6-digit clinic code',
                  style: Styles.headerText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'You can get this code by contacting your local clinic if they support the app.',
                    style: Styles.captionText,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 36.0),
                TextFormField(
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z\d]')),
                  ],
                  decoration: InputDecoration(
                    errorStyle: Styles.hiddenText,
                    border: InputBorder.none,
                    hintText: 'XXXXXX',
                    hintStyle: Styles.codeHint,
                  ),
                  style: Styles.codeText,
                  validator: _validate,
                  onSaved: (value) => clinicCode = value,
                  controller: controller,
                ),
                if (errorText != null)
                  Text(
                    errorText,
                    textAlign: TextAlign.center,
                    style: Styles.codeError,
                  ),
                SizedBox(height: 16.0),
                ContinueButton(
                  onPressed: submitEnabled ? () => _submit(context) : null,
                  text: "Continue",
                  color: Colors.black,
                  shape: StadiumBorder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersonalInfoScreen extends StatefulWidget {
  @override
  PersonalInfoState createState() => PersonalInfoState();
}

class PersonalInfoState extends State<PersonalInfoScreen> {
  final formKey = GlobalKey<FormState>();

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
                  // TODO: replace with styled "Next" button
                  Positioned(
                    top: 14,
                    right: 14,
                    child: RaisedButton(
                      onPressed: () {
                        formKey.currentState.validate();
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          'Personal Info',
                          style: Styles.appBarTitle,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Let the clinic know who you are.',
                          style: Styles.appBarSubtitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              SizedBox(
                height: 2.0,
                child: LinearProgressIndicator(
                  value: 1 / 3,
                  backgroundColor: Styles.grey200,
                  valueColor: AlwaysStoppedAnimation(Styles.trifidBlue),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: TextInput(
                                  label: "First Name",
                                  validator: (value) => value.isEmpty
                                      ? "Please enter a first name"
                                      : null,
                                ),
                              ),
                              VerticalDivider(width: 1, color: Styles.grey300),
                              Flexible(
                                child: TextInput(
                                  label: "Last Name",
                                  validator: (value) => value.isEmpty
                                      ? "Please enter a last name"
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextInput(
                          label: "Middle Name",
                          validator: (value) => value.isEmpty
                              ? "Please enter a middle name"
                              : null,
                        ),
                        // TODO: use native date selector
                        TextInput(
                          label: "Date of Birth",
                          validator: (value) => value.isEmpty
                              ? "Please enter a date of birth"
                              : null,
                        ),
                        RadioInput("Sex", {
                          'Male': Sex.male,
                          'Female': Sex.female,
                          'Other': Sex.other,
                        }),
                        // TODO: custom SSN masking, and hide input when unfocused
                        TextInput(
                          label: "Social Security Number (SSN)",
                          keyboardType: TextInputType.number,
                          secure: true,
                          validator: (value) => value.isEmpty
                              ? "Please enter your social security number"
                              : null,
                        ),
                        // TODO: allow addresses to be added, removed, edited
                        AddressInput(),
                        PhoneNumberInput(
                          label: "Phone Number",
                        ),
                        // TODO: email address validation
                        TextInput(
                          label: "Email (optional)",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        ListHeader("EMERGENCY CONTACT"),
                        TextInput(
                          label: "Emergency Contact Name",
                          validator: (value) => value.isEmpty
                              ? "Please enter an emergency contact"
                              : null,
                        ),
                        PhoneNumberInput(
                          label: "Emergency Contact Phone Number",
                        ),
                        TextInput(
                          label: "Relationship to Emergency Contact",
                          validator: (value) => value.isEmpty
                              ? "Please enter your relationship to the "
                                  "emergency contact"
                              : null,
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
                        // TODO: disable until form is valid
                        ContinueButton(
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InsuranceScreen(),
                                ),
                              );
                            }
                          },
                          text: "Next Step: Billing & Insurance",
                        ),
                      ],
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
                          style: Styles.appBarTitle,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Let the clinic know your insurance plan.',
                          style: Styles.appBarSubtitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              SizedBox(
                height: 2.0,
                child: LinearProgressIndicator(
                  value: 2 / 3,
                  backgroundColor: Styles.grey200,
                  valueColor: AlwaysStoppedAnimation(Styles.trifidBlue),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    new TextInput(
                      label: "Insurance Company Name",
                    ),
                    new PhoneNumberInput(
                      label: "Insurance Company Phone Number",
                    ),
                    new TextInput(
                      label: "Policy Holder First Name",
                    ),
                    new TextInput(
                      label: "Policy Holder Last Name",
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(
                            // TODO: numbers only
                            child: new TextInput(
                              label: "Policy Number",
                            ),
                          ),
                          VerticalDivider(width: 1, color: Styles.grey300),
                          Flexible(
                            // TODO: numbers only
                            child: new TextInput(
                              label: "Group Number",
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO: disable until form is valid
                    ContinueButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicalHistoryScreen(),
                        ),
                      ),
                      text: "Next Step: Medical History",
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
                          style: Styles.appBarTitle,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Descibe your allergies and medical history.',
                          style: Styles.appBarSubtitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              SizedBox(
                height: 2.0,
                child: LinearProgressIndicator(
                  value: 3 / 3,
                  backgroundColor: Styles.grey200,
                  valueColor: AlwaysStoppedAnimation(Styles.trifidBlue),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 16.0),
                    // TODO: dynamically add, edit, remove allergies
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
                    SizedBox(height: 32.0),
                    // TODO: dynamically add, edit, remove medications
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
                    SizedBox(height: 16.0),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Styles.inputBoxBorder,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Immunizations',
                                style: Styles.detailTitleText,
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
                                  style: Styles.detailTitleText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO: native year input selector
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
                        // TODO: search term should be used to filter conditions
                        SearchBar(
                          controller: TextEditingController(),
                          focusNode: FocusNode(),
                        ),
                        SizedBox(height: 12.0),
                        ConditionsInput(),
                      ],
                    ),
                    SizedBox(height: 32.0),
                    // TODO: dynamically add, edit, remove surgical history
                    DetailListInput(
                      title: "Surgical History",
                      subtitle: "List any surgeries you have had in the past",
                      children: [
                        SizedBox(height: 10.0),
                        DetailCard(
                          title: "Knee Surgey",
                          subtitle: "2002",
                          caption: "Baptist Medical Center (Jacksonville)",
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    // TODO: disable until form is valid
                    ContinueButton(text: "Next Step: Symptoms"),
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

class ContinueButton extends StatelessWidget {
  final String text;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  const ContinueButton({
    Key key,
    @required this.text,
    this.color,
    this.shape,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: RaisedButton(
        onPressed: onPressed,
        color: color ?? Styles.trifidBlue,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
        child: Container(
          padding: EdgeInsets.all(13.0),
          child: Text(text, style: Styles.buttonText),
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
            secondarySelectedColor: Styles.trifidBlue,
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            labelStyle: Styles.conditionsText,
            secondaryLabelStyle: Styles.conditionsSelectedText),
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
                      ? Styles.trifidBlue
                      : Styles.grey300,
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
                border: Styles.inputBoxBorder,
              ),
              padding: Styles.inputPadding,
              child: Text(
                title,
                style: Styles.disabledInputText,
              ),
            ),
          ),
          VerticalDivider(
            width: 1,
            color: Styles.grey300,
          ),
          Expanded(
            flex: 1,
            child: TextInput(
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
    this.noIcon = false,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: Styles.detailTitleText,
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      subtitle,
                      style: Styles.detailDescriptionText,
                    ),
                  ],
                ),
              ),
              if (!noIcon)
                Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Styles.plusIcon,
                ),
            ],
          ),
          SizedBox(height: 13.0),
          // TODO: spacing between children
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
    this.subtitle,
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
                Expanded(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: Styles.detailTitleText,
                        ),
                        if (subtitle != null)
                          TextSpan(
                            text: "   " + subtitle,
                            style: Styles.detailSubtitleText,
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 14.0),
                Styles.penIcon,
              ],
            ),
            if (caption != null)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      caption,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.detailSubtitleText,
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
      color: Styles.grey200,
      padding: EdgeInsets.all(20),
      alignment: AlignmentDirectional.center,
      child: Text(title, style: Styles.listHeaderText),
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
        border: Styles.inputBoxBorder,
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Address',
            style: Styles.inputLabelSmallText,
          ),
          SizedBox(height: 10.0),
          DetailCard(
            title: '814 Lasalle St',
            caption: 'Jacksonville, Florida 32207',
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
    return Container(
      decoration: BoxDecoration(
        border: Styles.inputBoxBorder,
      ),
      padding: EdgeInsets.symmetric(vertical: 14.0),
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
                  style: Styles.inputLabelSmallText,
                ),
                SizedBox(height: 8.0),
                Text(
                  _stringValue(),
                  style: Styles.inputText,
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
          ),
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
    return Container(
      decoration: BoxDecoration(
        border: Styles.inputBoxBorder,
      ),
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.label,
              style: Styles.inputLabelSmallText,
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
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class PhoneNumberInput extends StatefulWidget {
  final String label;

  PhoneNumberInput({
    @required this.label,
  });

  @override
  PhoneNumberInputState createState() => PhoneNumberInputState();
}

class PhoneNumberInputState extends State<PhoneNumberInput> {
  final controller = TextEditingController();

  // Prevent race conditions with async formatting
  final lock = Lock();

  Future<String> validatePhoneNumber(String text) async {
    if (text.isEmpty) {
      return Future<String>.value("Please enter a phone number");
    } else {
      return await PhoneNumberUtil.isValidPhoneNumber(
        phoneNumber: text,
        isoCode: 'US',
      ).then((isValid) => isValid ? null : "Invalid phone number");
    }
  }

  void formatPhoneNumber() async {
    lock.synchronized(() async {
      final phoneNumber = RegExp(r'\d+')
          .allMatches(controller.text)
          .map<String>((Match match) => match.group(0))
          .join();

      if (phoneNumber.isEmpty) {
        // Remove invalid chars
        controller.text = "";
      } else {
        await PhoneNumberUtil.formatAsYouType(
          phoneNumber: phoneNumber,
          isoCode: 'US',
        ).then((text) {
          controller.value = controller.value.copyWith(
            text: text,
            selection: TextSelection(
              baseOffset: text.length,
              extentOffset: text.length,
            ),
            composing: TextRange.empty,
          );
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(formatPhoneNumber);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(formatPhoneNumber);
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: controller,
      keyboardType: TextInputType.number,
      label: widget.label,
      // TODO: change based on phone number
      prefixText: "🇺🇸  ",
      validatorAsync: validatePhoneNumber,
    );
  }
}

class TextInput extends StatefulWidget {
  final String label;
  final bool secure;
  final bool centered;
  final String prefixText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final Future<String> Function(String) validatorAsync;
  final FormFieldSetter<String> onSaved;

  const TextInput({
    Key key,
    this.label,
    this.secure = false,
    this.centered = false,
    this.prefixText,
    this.keyboardType,
    this.controller,
    this.validator,
    this.validatorAsync,
    this.onSaved,
  }) : super(key: key);

  @override
  TextInputState createState() => TextInputState();
}

class TextInputState extends State<TextInput> {
  final controller = TextEditingController();
  String error;

  bool get hasError => error != null;

  @override
  Widget build(BuildContext context) {
    if (widget.validator != null && widget.validatorAsync != null) {
      throw ArgumentError("cannot specify both validator and validatorAsync");
    }

    final secureIcon = Image.asset("assets/secureicon.png", scale: 4);

    final labelStyle = Styles.inputLabelText.copyWith(
      color: widget.secure ? Styles.trifidBlue : Styles.inputLabelText.color,
    );
    final textStyle = Styles.inputText.copyWith(
      color: widget.secure
          ? Styles.trifidBlue
          : hasError ? Styles.errorRed : Styles.inputText.color,
    );

    Widget textField = TextFormField(
      textAlign: widget.centered ? TextAlign.center : TextAlign.start,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        errorStyle: Styles.hiddenText,
        enabledBorder: Styles.inputBorder,
        focusedBorder: Styles.inputBorder,
        errorBorder: Styles.inputBorder,
        labelText: widget.label,
        labelStyle: labelStyle,
        contentPadding: Styles.inputPadding,
        prefixText: widget.prefixText,
        prefixStyle: TextStyle(color: Colors.black),
        suffixIcon: hasError && !widget.secure ? Styles.errorIcon : null,
      ),
      style: textStyle,
      validator: (value) {
        if (widget.validator != null) {
          final result = widget.validator(value);
          setState(() => error = result);
          return result;
        } else if (widget.validatorAsync != null) {
          widget.validatorAsync(value).then((result) {
            setState(() => error = result);
          });
          // Keep the last error if we're validating asynchronously
          return error;
        }
        return null;
      },
      onSaved: widget.onSaved,
      controller: widget.controller ?? controller,
    );

    if (widget.secure)
      textField = Container(
        color: Styles.trifidBlue.withOpacity(0.05),
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
      );

    if (hasError)
      textField = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          textField,
          Container(
            color: Styles.errorRed,
            padding: EdgeInsets.all(16.0),
            child: Text(
              error,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );

    return textField;
  }
}
