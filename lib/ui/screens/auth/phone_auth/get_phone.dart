import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/states/countries.dart';
import 'package:hellohuts_app/states/auth_states/phone_auth.dart';
import 'package:hellohuts_app/ui/common_widgets/widgets.dart';
import 'package:hellohuts_app/ui/screens/auth/phone_auth/select_country.dart';
import 'package:hellohuts_app/ui/screens/auth/phone_auth/verify.dart';

import 'package:provider/provider.dart';


class PhoneAuthGetPhone extends StatefulWidget {


  final Color cardBackgroundColor = Color(0xFF6874C2);

  @override
  _PhoneAuthGetPhoneState createState() => _PhoneAuthGetPhoneState();
}

class _PhoneAuthGetPhoneState extends State<PhoneAuthGetPhone> {

  double _height, _width, _fixedPadding;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>(
      debugLabel: "scaffold-get-phone");

  @override
  Widget build(BuildContext context) {
    //  Fetching height & width parameters from the MediaQuery
    //  _logoPadding will be a constant, scaling it according to device's size
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _fixedPadding = _height * 0.025;
    final countriesProvider = Provider.of<CountryProvider>(context);
    final loader = Provider
        .of<PhoneAuthDataProvider>(context)
        .loading;
    /*  Scaffold: Using a Scaffold widget as parent
     *  SafeArea: As a precaution - wrapping all child descendants in SafeArea, so that even notched phones won't loose data
     *  Center: As we are just having Card widget - making it to stay in Center would really look good
     *  SingleChildScrollView: There can be chances arising where
     */

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: _getBody(countriesProvider),
              ),
            ),
            loader ? CircularProgressIndicator() : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _getBody(CountryProvider countriesProvider) =>
      Card(
        color: widget.cardBackgroundColor,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: SizedBox(
          height: _height * 8 / 10,
          width: _width * 8 / 10,

          /*
           * Fetching countries data from JSON file and storing them in a List of Country model:
           * ref:- List<Country> countries
           * Until the data is fetched, there will be CircularProgressIndicator showing, describing something is on it's way
           * (Previously there was a FutureBuilder rather that the below thing, which created unexpected exceptions and had to be removed)
           */
          child: countriesProvider.countries.length > 0
              ? _getColumnBody(countriesProvider)
              : Center(child: CircularProgressIndicator()),
        ),
      );

  Widget _getColumnBody(CountryProvider countriesProvider) =>
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: _fixedPadding, left: _fixedPadding),
              child: SubTitle(text: 'Select your country'),
            ),

            /*
             *  Select your country, this will be a custom DropDown menu, rather than just as a dropDown
             *  onTap of this, will show a Dialog asking the user to select country they reside,
             *  according to their selection, prefix will change in the PhoneNumber TextFormField
             */
            Padding(
                padding:
                EdgeInsets.only(left: _fixedPadding, right: _fixedPadding),
                child: ShowSelectedCountry(
                  country: countriesProvider.selectedCountry,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SelectCountry()),
                    );
                  },
                )),

            //  Subtitle for Enter your phone
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: _fixedPadding),
              child: SubTitle(text: 'Phone Number'),
            ),
            //  PhoneNumber TextFormFields
            Padding(
              padding: EdgeInsets.only(
                  left: _fixedPadding,
                  right: _fixedPadding,
                  bottom: _fixedPadding),
              child: PhoneNumberField(
                controller:
                Provider
                    .of<PhoneAuthDataProvider>(context, listen: false)
                    .phoneNumberController,
                prefix: countriesProvider.selectedCountry.dialCode ?? "+91",
              ),
            ),

            /*
             *  Some informative text
             */
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(width: _fixedPadding),
                Icon(Icons.info, color: Colors.white, size: 20.0),
                SizedBox(width: 10.0),
                Expanded(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'We will send ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: 'One Time Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: ' to this mobile number',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400)),
                  ])),
                ),
                SizedBox(width: _fixedPadding),
              ],
            ),

            /*
             *  Button: OnTap of this, it appends the dial code and the phone number entered by the user to send OTP,
             *  knowing once the OTP has been sent to the user - the user will be navigated to a new Screen,
             *  where is asked to enter the OTP he has received on his mobile (or) wait for the system to automatically detect the OTP
             */
            SizedBox(height: _fixedPadding * 1.5),
            RaisedButton(
              elevation: 16.0,
              onPressed: startPhoneAuth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'SEND OTP',
                  style: TextStyle(
                      color: widget.cardBackgroundColor, fontSize: 18.0),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          ],
        ),
      );

  _showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text('$text'),
    );
//    if (mounted) Scaffold.of(context).showSnackBar(snackBar);
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  startPhoneAuth() async {
    final phoneAuthDataProvider =
    Provider.of<PhoneAuthDataProvider>(context, listen: false);
    phoneAuthDataProvider.loading = true;
    var countryProvider = Provider.of<CountryProvider>(context, listen: false);
    bool validPhone = await phoneAuthDataProvider.instantiate(
        dialCode: countryProvider.selectedCountry.dialCode,
        onCodeSent: () {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
              builder: (BuildContext context) => PhoneAuthVerify()));
        },
        onFailed: () {
          _showSnackBar(phoneAuthDataProvider.message);
        },
        onError: () {
          _showSnackBar(phoneAuthDataProvider.message);
        });
    if (!validPhone) {
      phoneAuthDataProvider.loading = false;
      _showSnackBar("Oops! Number seems invaild");
      return;
    }
  }
}