import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/comment/comment.dart';
import 'package:hellohuts_app/states/comment/comment_state.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/interactions/comment/comments_placeholder.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:provider/provider.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final Function(String) onSubmitPressed;
  final bool isImageSupported;
  final VoidCallback onCameraClicked;
  final String hintText;

  const CustomTextFieldWidget({
    Key key,
    this.onSubmitPressed,
    this.isImageSupported,
    this.onCameraClicked,
    this.hintText,
  }) : super(key: key);

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _isTyping = false;
  TextEditingController _controller = new TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String text) {
    if (text.length > 0) {
      if (!_isTyping) {
        setState(() {
          _isTyping = true;
        });
      }
    }
    if (text.length == 0) {
      setState(() {
        _isTyping = false;
      });
    }
  }

  void _onSubmitted(String text) {
    if (text.length > 0) {
      if (widget.onSubmitPressed != null) {
        widget.onSubmitPressed(text);
        _controller.text = "";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = fullWidth(context);
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: width * 0.8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: theme.colorScheme.secondaryVariant,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, top: 14.0),
                        child: CustomAvatar(
                          radius: 10,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: _controller,
                          maxLength: 150,
                          minLines: 1,
                          maxLines: 8,
                          maxLengthEnforced: true,
                          buildCounter: null,
                          style:
                              theme.textTheme.bodyText2.copyWith(fontSize: 16),
                          keyboardType: TextInputType.multiline,
                          onChanged: (text) {
                            _onChanged(text);
                          },
                          decoration: InputDecoration(
                            hintText: widget.hintText ?? "Add Comment",
                            hintStyle: theme.textTheme.bodyText2
                                .copyWith(color: AppColors.kbDarkGrey),
                            counterText: "",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            fillColor: theme.colorScheme.surface,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      _isTyping
                          ? SizedBox()
                          : IconButton(
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                color: AppColors.kbDarkGrey,
                              ),
                              onPressed: () => {
                                    print("user wants to select photos"),
                                    if (widget.onCameraClicked != null)
                                      {
                                        widget.onCameraClicked(),
                                      }
                                    //TODO: add photo selecting functionality here
                                  }),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(right:8),
                      decoration: BoxDecoration(
                          // color:theme.colorScheme.secondaryVariant,

                          shape: BoxShape.circle),
                      child: IconButton(
                          icon: Image.asset(HelloIcons.send_bold_icon,
                              color: AppColors.kbDarkGrey, height: 28),
                          onPressed: () => {
                                _onSubmitted(_controller.text),
                              })),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
