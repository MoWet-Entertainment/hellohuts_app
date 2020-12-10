import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/models/dashboard/project_details/project_details.dart';
import 'package:hellohuts_app/states/dashboard/dashboard_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/common_widgets/rounded_charts/radial_chart.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/app_themes.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:hooks_riverpod/all.dart';

class ProjectDetailsPage extends ConsumerWidget {
  const ProjectDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = Theme.of(context);
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);

    return Scaffold(
      appBar: CustomAppBar(
        isBackButton: true,
        onBackButtonPressed: _onBackButtonPressed,
        title: Text(
          "Project Details",
          style: theme.textTheme.bodyText1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: _ProjectDetailsBody(),
    );
  }

  void _onBackButtonPressed() {
    ExtendedNavigator.root.pop();
  }
}

class _ProjectDetailsBody extends ConsumerWidget {
  const _ProjectDetailsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = Theme.of(context);
    final projectDetails = watch(projectDetailsProvider);
    return projectDetails.map(
        data: (_) => _projectDetailsWidget(theme, _.value),
        loading: (_) => Center(child: CircularProgressIndicator()),
        error: (_) => Text(
              _.error.toString(),
              style: theme.textTheme.bodyText1.copyWith(color: Colors.red),
            ));
  }

  Widget _projectDetailsWidget(ThemeData theme, ProjectDetailsModel model) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _ProjectSnapshotCard(
            model: model,
          ),
          _ProjectContactDetailsSection(
            model: model,
          ),
          _FloorPlansHeading(),
          _FloorPlansBody(),
          _ProjectOverviewSection(
            model: model,
          ),
          _SelectedPlanSection(),
        ],
      ),
    ));
  }
}

class _FloorPlansHeading extends StatelessWidget {
  const _FloorPlansHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Floor Plans",
            style: theme.textTheme.bodyText1
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class _FloorPlansBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      child: new ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return new Card(
              elevation: 0.5,
              child: new Container(
                width: 200.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: new Placeholder()),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "Ground Floor Plan",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ));
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _ProjectOverviewSection extends StatelessWidget {
  final ProjectDetailsModel model;
  const _ProjectOverviewSection({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Project Overview",
                style: theme.textTheme.bodyText1
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              _projectOverViewListTile(context,
                  title: 'Base Rate',
                  description: '${convertCurrency(model.baseRate)} per Sq.ft'),
              _projectOverViewListTile(context,
                  title: 'Total Area',
                  description: '${model.projectArea} Sq.ft'),
              _projectOverViewListTile(context,
                  title: 'Project Estimate',
                  description: '${convertCurrency(model.projectEstimate)}'),
              _projectOverViewListTile(context,
                  title: 'Start date',
                  description: '${model.projectStartDate}'),
              (model.projectDateOfCompletion != null)
                  ? _projectOverViewListTile(context,
                      title: 'Completion date',
                      description: '${model.projectDateOfCompletion}')
                  : _projectOverViewListTile(context,
                      title: 'Exp. Completion',
                      description: '${model.projectEstDateOfCompletion}'),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget _projectOverViewListTile(BuildContext context,
      {String title, String description}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: fullWidth(context) * 0.40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title ?? ''),
                Text(':'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  description ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyText1
                      .copyWith(fontWeight: FontWeight.bold),
                )),
          ),
        ]),
      ),
    );
  }
}

class _SelectedPlanSection extends StatelessWidget {
  const _SelectedPlanSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top:16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Selected Plan",
                style: theme.textTheme.bodyText1
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            
          ),
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
               Container(width: fullWidth(context)*0.45,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Flexible(
                                        child: Text("Building Materials", style: theme.textTheme.bodyText1
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold), ),
                   ),
                   Text(":"),
                 ],
               ),
               ),
               Container(
                 padding: const EdgeInsets.only(left:8),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   
                   Text("Best",style: theme.textTheme.bodyText1
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.kbDarkGreen)),
                      Container(
                        child: Text("Change", style:theme.textTheme.bodyText1
                      .copyWith(fontSize: 14, color: AppColors.kbDarkGrey),),
                      ),
                   ],
                 ),
               )
               
              ],
            )
          )
        ],
      ),
    );
  }
}

class _ProjectContactDetailsSection extends StatelessWidget {
  final ProjectDetailsModel model;
  const _ProjectContactDetailsSection({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _projectContactDetails(theme, model);
  }

  Widget _projectContactDetails(ThemeData theme, ProjectDetailsModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customIconSquare(
                  iconAsset: HelloIcons.location_light_icon,
                  backgroundColor: Colors.transparent),
              Flexible(
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                            text: model.projectAddress.address1,
                            style: theme.textTheme.bodyText1
                                .copyWith(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(text: ","),
                              TextSpan(
                                text: model.projectAddress.postalLoc,
                                style: theme.textTheme.bodyText1,
                              ),
                            ]),
                      ),
                      Text(model.projectAddress.district,
                          style: theme.textTheme.bodyText1
                              .copyWith(color: AppColors.kbDarkGrey)),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customIconSquare(
                  iconAsset: HelloIcons.bag_light_icon,
                  backgroundColor: Colors.transparent),
              Flexible(
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          text: model.contractor.contractorName,
                          style: theme.textTheme.bodyText1
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                          "from ${model.contractor.contractorCompany.companyName} Team",
                          style: theme.textTheme.bodyText1
                              .copyWith(color: AppColors.kbDarkGrey)),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customIconSquare(
                        iconAsset: HelloIcons.contractor_light_icon,
                        backgroundColor: Colors.transparent),
                    Flexible(
                      flex: 1,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              softWrap: true,
                              text: TextSpan(
                                text:
                                    model.projectEngineer.engineer.displayName,
                                style: theme.textTheme.bodyText1
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(model.projectEngineer.userRole,
                                style: theme.textTheme.bodyText1
                                    .copyWith(color: AppColors.kbDarkGrey)),
                          ]),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  customIconSquare(
                      iconAsset: HelloIcons.phone_bold_icon,
                      backgroundColor: Colors.transparent,
                      actionCall: () => {
                            launchUrl(
                                "tel:${model.projectEngineer.engineer.phoneNumber}"),

                            //TODO: Phone button clicked . This should launch phone dialer
                            print("User wants to call the engineer"),
                          }),
                  customIconSquare(
                      iconAsset: HelloIcons.mail_bold_icon,
                      backgroundColor: Colors.transparent,
                      actionCall: () => {
                            launchUrl(
                                '''mailto:${model.projectEngineer.engineer.email}?subject=Query on Project
                        &body=Dear ${model.projectEngineer.engineer.displayName.split(" ").first}
                         %0D%0AHope you are keeping well!%0D%0ACan you please call me back at 2 my time.
                         %0D%0A I have a few queries on my project'''),
                            //TODO: This should lauch the default mail app / whatsapp with to as users email
                            print("user wants to mail/chat with engineer"),
                          }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectSnapshotCard extends StatelessWidget {
  final ProjectDetailsModel model;
  const _ProjectSnapshotCard({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: isDark
            ? Theme.of(context).colorScheme.surface
            : AppColors.kbSmokedWhite,
      ),
      child: Container(
        child: LayoutBuilder(
          builder: (context, constrains) {
            print(constrains.maxWidth);
            if (constrains.maxWidth > 330) {
              return _NormalLayoutContainer(model: model);
            } else {
              return _SmallLayoutContainer(model: model);
            }
          },
        ),
      ),
    );
  }
}

class _NormalLayoutContainer extends StatelessWidget {
  final ProjectDetailsModel model;
  const _NormalLayoutContainer({Key key, @required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      heroDetailedContainerText(
                          heading: 'Area',
                          text: model.projectArea,
                          subTopText: 'sq.ft'),
                      Spacer(),
                      heroDetailedContainerText(
                          heading: 'Project Est',
                          text: convertProjectEstimate(model.projectEstimate)),
                      Spacer(),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 24,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    heroDetailedContainerText(
                        heading: 'Exp. completion',
                        text: model.projectEstDateOfCompletion,
                        textSize: 16),
                    Spacer(),
                    heroDetailedContainerText(
                        heading: 'Total Paid',
                        text: model.projectTotalPaid,
                        textSize: 16),
                    Spacer(),
                  ]),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: RadialPieChart(
                  completedPercentage:
                      double.parse(model.percentageOfCompletion),
                  widthOfCircle: 4,
                  progressIndicatorGradient: isDark
                      ? [Colors.orange[700], Colors.orange[600]]
                      : [AppColors.kbPrimaryYellow, AppColors.kbPrimaryYellow],
                  circleIndicatorGradient: isDark
                      ? [AppColors.kbDarkGrey, AppColors.kbDarkGrey]
                      : [AppColors.kbMediumGrey, AppColors.kbMediumGrey],
                  size: 80,
                ))
          ],
        ));
  }
}

class _SmallLayoutContainer extends StatelessWidget {
  final ProjectDetailsModel model;
  const _SmallLayoutContainer({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeOptions.of(context).isDarkTheme(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            RadialPieChart(
              completedPercentage: double.parse(model.percentageOfCompletion),
              widthOfCircle: 6,
              circleIndicatorGradient: isDark
                  ? [AppColors.kbDarkGrey, AppColors.kbDarkGrey]
                  : [AppColors.kbMediumGrey, AppColors.kbMediumGrey],
              mainTextFontSize: 24,
              size: 120,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heroDetailedContainerText(
                        heading: 'Area',
                        text: model.projectArea,
                        subTopText: 'sq.ft'),
                    heroDetailedContainerText(
                      heading: 'Project Est',
                      text: convertProjectEstimate(model.projectEstimate),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 24,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      heroDetailedContainerText(
                          heading: 'Exp. completion',
                          text: model.projectEstDateOfCompletion,
                          textSize: 16),
                      heroDetailedContainerText(
                          heading: 'Total Paid',
                          text: model.projectTotalPaid,
                          textSize: 16),
                    ]),
              ],
            ),
          ],
        ));
  }
}
