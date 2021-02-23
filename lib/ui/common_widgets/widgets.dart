import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/country.dart';

class PhoneAuthWidgets {
  static Widget getLogo({String logoPath, double height}) => Material(
        type: MaterialType.transparency,
        elevation: 10.0,
        child: Image.asset(logoPath, height: height),
      );
}

class SearchCountryTextField extends StatelessWidget {
  final TextEditingController controller;
  const SearchCountryTextField({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, top: 2.0, bottom: 2.0, right: 8.0),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: theme.colorScheme.secondaryVariant,
        ),
        child: TextFormField(
          autofocus: false,
          controller: controller,
          style: theme.textTheme.bodyText2.copyWith(
            fontSize: 14,
          ),
          decoration: InputDecoration(
              prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 8.0),
                  child: Image.asset(
                    HelloIcons.search_icon,
                    color: theme.colorScheme.onBackground.withOpacity(0.5),
                    height: 22,
                  )),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 44, maxWidth: 44),
              hintStyle: theme.textTheme.bodyText2.copyWith(
                fontSize: 12,
                color: theme.colorScheme.onBackground.withOpacity(0.5),
              ),
              filled: true,
              hintText: 'Search your country',
              contentPadding: const EdgeInsets.only(
                  left: 24.0, right: 5.0, top: 10.0, bottom: 10.0),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
              ),
              suffixIcon: (controller.text.trim().length == 0)
                  ? Container(
                      width: 0,
                    )
                  : GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 12.0),
                        child: Image.asset(
                          HelloIcons.close_circle_bold_icon,
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.5),
                          height: 16,
                        ),
                      ),
                      onTap: () {
                        controller.text = '';
                      }),
              suffixIconConstraints:
                  BoxConstraints(maxWidth: 40, maxHeight: 40)),
        ),
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String prefix;
  final Function(String) onTextChanged;

  const PhoneNumberField({Key key, this.controller, this.prefix, this.onTextChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: theme.dividerColor))),
      child: Row(
        children: <Widget>[
          Text("  " + prefix + "  ", style: theme.textTheme.bodyText1.copyWith(fontSize: 16)),
          SizedBox(width: 3.0),
          Container(height: 16,width: 1,color: theme.dividerColor),
          SizedBox(width:8.0),
          Expanded(
            child: TextFormField(
              style: theme.textTheme.bodyText1.copyWith(fontSize: 16) ,
              controller: controller,
              onChanged:onTextChanged ,
              autofocus: false,
              keyboardType: TextInputType.phone,
              key: Key('EnterPhone-TextFormField'),
              decoration: InputDecoration(
                border: InputBorder.none,
                errorMaxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String text;
  final TextStyle style;
  const SubTitle({Key key, this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(' $text',
            style: style ??
                TextStyle(
                    color: theme.colorScheme.onBackground, fontSize: 14.0)));
  }
}

class ShowSelectedCountry extends StatelessWidget {
  final VoidCallback onPressed;
  final Country country;

  const ShowSelectedCountry({Key key, this.onPressed, this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: theme.dividerColor))),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 4.0, right: 4.0, top: 8.0, bottom: 4.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                ' ${country.flag}  ${country.name}  (${country.dialCode})',
                style: theme.textTheme.bodyText2
                    .copyWith(color: theme.colorScheme.onBackground),
              )),
              Icon(
                Icons.arrow_drop_down,
                size: 24.0,
                color: theme.colorScheme.onBackground,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableWidget extends StatelessWidget {
  final Function(Country) selectThisCountry;
  final Country country;

  const SelectableWidget({Key key, this.selectThisCountry, this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      type: MaterialType.canvas,
      child: InkWell(
        onTap: () => selectThisCountry(country), //selectThisCountry(country),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "  " +
                country.flag +
                "  " +
                country.name +
                " (" +
                country.dialCode +
                ")",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
