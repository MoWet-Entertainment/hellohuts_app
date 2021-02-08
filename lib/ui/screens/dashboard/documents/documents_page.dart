import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/dashboard/documents_model/documents_model.dart';
import 'package:hellohuts_app/states/dashboard/documents_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'dart:math';

class DocumentsPage extends ConsumerWidget {
  const DocumentsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = Theme.of(context);

    bool isDark = Get.isDarkMode;
    return Scaffold(
      appBar: CustomAppBar(
        isBackButton: true,
        onBackButtonPressed: _onBackButtonPressed,
        title: Text(
          "Documents",
          style: theme.textTheme.bodyText1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: _DocumentsPageBody(),
    );
  }

  void _onBackButtonPressed() {
    ExtendedNavigator.root.pop();
  }
}

class _DocumentsPageBody extends StatelessWidget {
  const _DocumentsPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _DoumentsDetailWidget()),
          ],
        ),
      ),
    );
  }
}

class _DoumentsDetailWidget extends ConsumerWidget {
  const _DoumentsDetailWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final documentsProvider = watch(documentsStateProvider);
    final theme = Theme.of(context);
    return documentsProvider.map(
        data: (_) => _DocumentsListBodyWidget(
              model: _.data.value,
            ),
        loading: (_) => Center(child: CircularProgressIndicator()),
        error: (_) => Text(
              _.error.toString(),
              style: theme.textTheme.bodyText1.copyWith(color: Colors.red),
            ));
  }
}

class _DocumentsListBodyWidget extends StatelessWidget {
  DocumentsModel model;

  _DocumentsListBodyWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        _DocumentsListWidget(
          itemModel: model.projectDocuments,
          sectionHeading: "Project Documents",
        ),
        SizedBox(height: 12.0),
        _DocumentsListWidget(
          itemModel: model.personalDocuments,
          sectionHeading: "Personal Documents",
        ),
        SizedBox(height: 12.0),
        _DocumentsListWidget(
          itemModel: model.otherDocuments,
          sectionHeading: "Other Documents",
        ),
        SizedBox(height: 12.0),
        _DocumentsListWidget(
          itemModel: model.specificationDocuments,
          sectionHeading: "Specifications",
        ),
      ],
    );
  }
}

class _DocumentsListWidget extends StatelessWidget {
  List<DocumentsGroupModel> itemModel;
  String sectionHeading = '';
  _DocumentsListWidget({
    Key key,
    @required this.itemModel,
    @required this.sectionHeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionHeading,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyText1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 12,
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemModel.length,
            itemBuilder: (context, index) {
              itemModel[index] =
                  itemModel[index].copyWith(isDownloaded: Random().nextBool());
              print(itemModel[index].toString());
              return _itemTile(
                  item: itemModel[index],
                  context: context,
                  isEven: index % 2 == 0);
            })
      ],
    );
  }

  Widget _itemTile(
      {@required DocumentsGroupModel item,
      @required BuildContext context,
      bool isEven = false}) {
    final theme = Theme.of(context);
    final now = new DateTime.now();
    final isDarkTheme = Get.isDarkMode;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CustomListTileV2(
        model: item,
        isEven: isEven,
      ),
    );
  }
}

class CustomListTileV2 extends StatelessWidget {
  DocumentsGroupModel model;
  bool isEven = false;
  CustomListTileV2({
    Key key,
    this.model,
    this.isEven,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Get.isDarkMode;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isEven
              ? theme.colorScheme.secondary.withOpacity(0.7)
              : theme.colorScheme.secondary.withOpacity(0.4)),
      child: ListTile(
        leading: customIconSquare(
          backgroundColor:
              isDarkTheme ? AppColors.kDark_7 : theme.colorScheme.background,
          iconAsset: getLeadingIcon(model.documentsType),
          iconColor: isDarkTheme
              ? AppColors.kbMediumGrey
              : theme.colorScheme.onBackground,
          backgroundSize: 40,
          iconSize: 22,
          isCustomIcon: true,
        ),
        title: Text(
          model.itemName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: _GetTrailingIconForDoc(model: model),
        contentPadding: EdgeInsets.only(left: 8, right: 8),
      ),
    );
  }

  String getLeadingIcon(DocumentsType type) {
    switch (type) {
      case DocumentsType.ProjectDrawing:
        return HelloIcons.folder_light_icon;
      case DocumentsType.ProjectApproval:
      case DocumentsType.BillStatement:
      case DocumentsType.Specifications:
      case DocumentsType.WarrantyCard:
        return HelloIcons.document_light_icon;
      case DocumentsType.PersonalDoc:
        return HelloIcons.profile_light_icon;
      case DocumentsType.Specifications:
        return HelloIcons.profile_light_icon;
      default:
        return HelloIcons.document_light_icon;
    }
  }
}

class _GetTrailingIconForDoc extends StatefulWidget {
  _GetTrailingIconForDoc({
    Key key,
    @required this.model,
  }) : super(key: key);

  DocumentsGroupModel model;

  @override
  _GetTrailingIconForDocState createState() => _GetTrailingIconForDocState();
}

class _GetTrailingIconForDocState extends State<_GetTrailingIconForDoc> {
  setDownload() {
    widget.model =widget.model.copyWith(isDownloaded: true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.model.toString());

    if (!widget.model.isAvailable &&
        widget.model.documentsType != DocumentsType.PersonalDoc) {
      return SizedBox.shrink();
    } else if (!widget.model.isAvailable &&
        widget.model.documentsType == DocumentsType.PersonalDoc) {
      return IconButton(
        icon: Image.asset(
          HelloIcons.upload_bold_icon,
          height: 22,
          color: Colors.orange,
        ),
        onPressed: () => {},
      );
    } else if (widget.model.isAvailable) {
      if (widget.model.isDownloaded == null) {
        return IconButton(
          icon: Image.asset(
            HelloIcons.download_bold_icon,
            height: 22,
            color: Colors.blue,
          ),
          onPressed: () => {
setDownload(),
            print(widget.model.toString()),
          },
        );
      } else if (widget.model.isDownloaded) {
        print("model.isDownloaded:${widget.model.isDownloaded}");
        return IconButton(
          icon: Image.asset(
            HelloIcons.tick_bold_icon,
            color: AppColors.kbDarkGreen,
            height: 18,
          ),
          onPressed: () => {},
        );
      } else {
        return IconButton(
          icon: Image.asset(
            HelloIcons.download_bold_icon,
            height: 22,
            color: Colors.blue,
          ),
          onPressed: () => {
setDownload(),   
print("downloaded")       },
        );
      }
    } else {
      print("Some issue");
      return SizedBox.shrink();
    }
  }
}
