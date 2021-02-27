import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/models/country.dart';
import 'package:hellohuts_app/states/countries.dart';

import 'package:hellohuts_app/states/auth_states/phone_auth.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/widgets.dart';
import 'package:provider/provider.dart';

class SelectCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final countriesProvider = Provider.of<CountryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: theme.colorScheme.onBackground,
          ),
          onTap: () => {
            ExtendedNavigator.root.pop(),
          },
        ),
        title: Text(
          'Select Country',
          style: theme.textTheme.bodyText1
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50.0),
          child: SearchCountryTextField(
              controller: countriesProvider.searchController),
        ),
      ),
      body: ListView.builder(
        itemCount: countriesProvider.searchResults.length,
        itemBuilder: (BuildContext context, int i) {
          return SelectableWidget(
            country: countriesProvider.searchResults[i],
            selectThisCountry: (Country c) {
              print(i);
              countriesProvider.selectedCountry = c;
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
