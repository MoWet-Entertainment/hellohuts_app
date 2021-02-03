import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hooks_riverpod/all.dart';

import 'package:hellohuts_app/models/dashboard/documents_model/documents_model.dart';
import 'package:hellohuts_app/states/dashboard/documents_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:timeago/timeago.dart' as timeago;

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
        _DocumentsListWidget(
          itemModel: model.personalDocuments,
          sectionHeading: "Personal Documents",
        ),
        _DocumentsListWidget(
          itemModel: model.otherDocuments,
          sectionHeading: "Other Documents",
        ),
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
        SizedBox(height: 12,),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemModel.length,
            itemBuilder: (context, index) {
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
    final difference = now.difference(item.updatedTimeStamp);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomListTile(
        tilePadding:
            const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 12),
        backgroundColor: theme.colorScheme.secondaryVariant,
        borderRadius: BorderRadius.circular(20.0),
        leading: customIconSquare(
          backgroundColor:
              isDarkTheme ? AppColors.kDark_7 : theme.colorScheme.background,
          iconAsset: HelloIcons.folder_light_icon,
          iconColor: isDarkTheme
              ? AppColors.kbMediumGrey
              : theme.colorScheme.onBackground,
          backgroundSize: 48,
          iconSize: 24,
          isCustomIcon: true,
        ),
        titleText: Text(
          item.itemName,
          style: theme.textTheme.bodyText2
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subTitle: Text(
          timeago.format(
            now.subtract(difference),
          ),
          style: theme.textTheme.bodyText2
              .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
        ),
        trailing: _getTrailingWidget(item, context),
      ),
    );
  }

  Widget _getTrailingWidget(DocumentsGroupModel item, BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = Get.isDarkMode;
    if (item.isAvailable) {
      if (item.isDownloaded != null && item.isDownloaded) {
        return customIconSquare(
          backgroundColor:
              isDarkTheme ? AppColors.kDark_7 : theme.colorScheme.background,
          iconAsset: HelloIcons.download_light_icon,
          iconColor: isDarkTheme
              ? AppColors.kbMediumGrey
              : theme.colorScheme.onBackground,
          backgroundSize: 48,
          iconSize: 24,
          isCustomIcon: true,
        );
      } else {
        return customIconSquare(
          backgroundColor:
              isDarkTheme ? AppColors.kDark_7 : theme.colorScheme.background,
          iconAsset: HelloIcons.download_light_icon,
          iconColor: isDarkTheme
              ? AppColors.kbMediumGrey
              : theme.colorScheme.onBackground,
          backgroundSize: 48,
          iconSize: 24,
          isCustomIcon: true,
        );
      }
    } else {
      SizedBox.shrink();
    }
  }
}
