import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/ui/routes/router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:hellohuts_app/constants/constants.dart';
import 'package:hellohuts_app/models/dashboard/documents_model/documents_model.dart';
import 'package:hellohuts_app/states/dashboard/documents_state.dart';
import 'package:hellohuts_app/ui/common_widgets/app_bar/app_bar.dart';
import 'package:hellohuts_app/ui/common_widgets/custom_widgets.dart';
import 'package:hellohuts_app/ui/styles/app_colors.dart';
import 'package:hellohuts_app/ui/styles/theme_options.dart';
import 'package:intl/intl.dart';

const debug = true;

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.kYellowLight,
          elevation: 0.5,
          heroTag: 'DocumentsFileUpload',
          child: Image.asset(HelloIcons.plus_bold_icon,
              height: 28, color: theme.colorScheme.background),
          onPressed: () {
            ExtendedNavigator.root.push(Routes.documentsUploadPage);
          },
        ),
      ),
    );
  }

  void _onBackButtonPressed() {
    ExtendedNavigator.root.pop();
  }
}

class _DocumentsPageBody extends ConsumerWidget {
  const _DocumentsPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isDarkTheme = ThemeOptions.of(context).isDarkTheme(context);
    final documentsProvider = watch(documentsStateProvider);
    final theme = Theme.of(context);
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
      // child: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 24),
      //   child: ListView(
      //     children: [
      //       SizedBox(height: 12),
      //       Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //           child: _DoumentsDetailWidget()),
      //     ],
      //   ),
      // ),
      child: _DoumentsDetailWidget(),
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
        data: (_) => DocumentsWidget(
              title: "",
              platform: theme.platform,
              model: documentsProvider.data.value,
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

class _DocumentsListWidget extends StatefulWidget with WidgetsBindingObserver {
  List<DocumentsGroupModel> itemModel;
  String sectionHeading = '';
  _DocumentsListWidget({
    Key key,
    @required this.itemModel,
    @required this.sectionHeading,
  }) : super(key: key);

  @override
  __DocumentsListWidgetState createState() => __DocumentsListWidgetState();
}

class __DocumentsListWidgetState extends State<_DocumentsListWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return widget.itemModel.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sectionHeading,
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
                  itemCount: widget.itemModel.length,
                  itemBuilder: (context, index) {
                    widget.itemModel[index] = widget.itemModel[index]
                        .copyWith(isDownloaded: Random().nextBool());
                    print(widget.itemModel[index].toString());
                    return _itemTile(
                        item: widget.itemModel[index],
                        context: context,
                        isEven: index % 2 == 0);
                  })
            ],
          )
        : SizedBox.shrink();
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
      child: DownloadableListTile(
        model: item,
        isEven: isEven,
      ),
    );
  }
}

class DownloadableListTile extends StatelessWidget {
  DocumentsGroupModel model;
  bool isEven = false;
  DownloadableListTile({
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
  @override
  void initState() {
    super.initState();
  }

  setDownload() {
    widget.model = widget.model.copyWith(isDownloaded: true);
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
            print(widget.model.toString()),
          },
        );
      }
    } else {
      print("Some issue");
      return SizedBox.shrink();
    }
  }
}

class DocumentsWidget extends StatefulWidget with WidgetsBindingObserver {
  final TargetPlatform platform;
  DocumentsModel model;
  DocumentsWidget({
    Key key,
    this.platform,
    this.model,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _DocumentsWidgetState createState() => new _DocumentsWidgetState();
}

class _DocumentsWidgetState extends State<DocumentsWidget> {
  List<_TaskInfo> _tasks;
  List<_ItemHolder> _items;
  bool _isLoading;
  bool _permissionReady;
  String _localPath;
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _isLoading = true;
    _permissionReady = false;

    _prepare();
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      if (debug) {
        print('UI Isolate Callback: $data');
      }
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      if (_tasks != null && _tasks.isNotEmpty) {
        final task = _tasks.firstWhere((task) => task.taskId == id);
        if (task != null) {
          setState(() {
            task.status = status;
            task.progress = progress;
          });
        }
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    if (debug) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Builder(
            builder: (context) => _isLoading
                ? new Center(
                    child: new CircularProgressIndicator(),
                  )
                : _permissionReady
                    ? _buildDownloadList()
                    : _buildNoPermissionWarning()),
      ),
    );
  }

  Widget _buildDownloadList() => Container(
        child: ListView(
          children: _items
              .asMap()
              .map((index, item) => MapEntry(
                  index,
                  item.task == null
                      ? _buildListSection(item.name)
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: DownloadItem(
                            data: item,
                            isEven: index % 2 == 0,
                            onItemClick: (task) {
                              _openDownloadedFile(task).then((success) {
                                if (!success) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Cannot open this file')));
                                }
                              });
                            },
                            onAtionClick: (task) {
                              if (task.status == DownloadTaskStatus.undefined) {
                                _requestDownload(task);
                              } else if (task.status ==
                                  DownloadTaskStatus.running) {
                                _cancelDownload(task);
                              } else if (task.status ==
                                  DownloadTaskStatus.paused) {
                                _resumeDownload(task);
                              } else if (task.status ==
                                  DownloadTaskStatus.complete) {
                                _delete(task);
                              } else if (task.status ==
                                  DownloadTaskStatus.failed) {
                                _retryDownload(task);
                              }
                            },
                          ),
                        )))
              .values
              .toList(),
        ),
      );

  Widget _buildListSection(String title) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: Builder(
            builder: (context) => Container(
                  padding: const EdgeInsets.only(top: 18, bottom: 12),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )),
      );

  Widget _buildNoPermissionWarning() => Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Please grant accessing storage permission to continue -_-',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              FlatButton(
                  onPressed: () {
                    _checkPermission().then((hasGranted) {
                      setState(() {
                        _permissionReady = hasGranted;
                      });
                    });
                  },
                  child: Text(
                    'Retry',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ))
            ],
          ),
        ),
      );

  void _requestDownload(_TaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
        url: task.link,
        headers: {"auth": "test_for_sql_encoding"},
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: true);
  }

  void _cancelDownload(_TaskInfo task) async {
    await FlutterDownloader.cancel(taskId: task.taskId);
  }

  void _pauseDownload(_TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId);
  }

  void _resumeDownload(_TaskInfo task) async {
    String newTaskId = await FlutterDownloader.resume(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  void _retryDownload(_TaskInfo task) async {
    String newTaskId = await FlutterDownloader.retry(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  Future<bool> _openDownloadedFile(_TaskInfo task) {
    return FlutterDownloader.open(taskId: task.taskId);
  }

  void _delete(_TaskInfo task) async {
    await FlutterDownloader.remove(
        taskId: task.taskId, shouldDeleteContent: true);
    await _prepare();
    setState(() {});
  }

  Future<bool> _checkPermission() async {
    if (widget.platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<Null> _prepare() async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    _tasks.addAll(widget.model.projectDocuments?.map((item) => _TaskInfo(
          name: item.itemName,
          link: item.downloadUrl,
          itemModel: item,
        )));
    _items.add(_ItemHolder(name: 'Project Documents'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      count++;
    }

    _tasks.addAll(widget.model.personalDocuments.map((item) => _TaskInfo(
          name: item.itemName,
          link: item.downloadUrl,
          itemModel: item,
        )));
    _items.add(_ItemHolder(name: 'Personal Documents'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      count++;
    }

    _tasks.addAll(widget.model.otherDocuments?.map((item) => _TaskInfo(
          name: item.itemName,
          link: item.downloadUrl,
          itemModel: item,
        )));
    _items.add(_ItemHolder(name: 'Other Documents'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      count++;
    }

    _tasks.addAll(widget.model.specificationDocuments?.map((item) => _TaskInfo(
          name: item.itemName,
          link: item.downloadUrl,
          itemModel: item,
        )));
    _items.add(_ItemHolder(name: 'Specifications'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      count++;
    }

    tasks?.forEach((task) {
      for (_TaskInfo info in _tasks) {
        if (info.link == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });

    _permissionReady = await _checkPermission();

    _localPath = (await _findLocalPath()) + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<String> _findLocalPath() async {
    final directory = widget.platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }
}

class DownloadItem extends StatelessWidget {
  final _ItemHolder data;
  final bool isEven;
  final Function(_TaskInfo) onItemClick;
  final Function(_TaskInfo) onAtionClick;

  DownloadItem({
    Key key,
    this.data,
    this.isEven = false,
    this.onItemClick,
    this.onAtionClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = Get.isDarkMode;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: theme.colorScheme.secondaryVariant.withOpacity(1)),
      child: ListTile(
        onTap: data.task.status == DownloadTaskStatus.complete
            ? () {
                onItemClick(data.task);
              }
            : null,
        leading: customIconSquare(
          backgroundColor:
              isDarkTheme ? AppColors.kDark_7 : theme.colorScheme.background,
          iconAsset: getLeadingIcon(data.task.itemModel.documentsType),
          iconColor: isDarkTheme
              ? AppColors.kbMediumGrey
              : theme.colorScheme.onBackground,
          backgroundSize: 44,
          iconSize: 22,
          isCustomIcon: true,
        ),
        title: Text(
          data.name,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyText2
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        subtitle: Row(
          children: [
            data.task.itemModel.updatedTimeStamp != null
                ? Text(
                    DateFormat.yMMMd()
                        .format(data.task.itemModel.updatedTimeStamp.toLocal()),
                    style: theme.textTheme.bodyText2
              .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
              )
                : Text(
                    "Yet to Upload",
                  style: theme.textTheme.bodyText2
              .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                ),
          ],
        ),
        trailing: data.task.status == DownloadTaskStatus.running ||
                data.task.status == DownloadTaskStatus.paused
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${data.task.progress}%",
                    style: TextStyle(fontSize: 10.0),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      // print("User wants to upload the item");
                    },
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      backgroundColor: AppColors.kbDarkGrey,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          AppColors.kbPrimaryYellow),
                      value: data.task.progress / 100,
                    ),
                    shape: CircleBorder(),
                    constraints:
                        BoxConstraints(maxHeight: 20.0, maxWidth: 20.0),
                  ),
                ],
              )
            : _buildActionForTask(data),
        contentPadding: EdgeInsets.only(left: 8, right: 8),
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.only(left: 16.0, right: 4.0),
    //   child: InkWell(
    //     onTap: data.task.status == DownloadTaskStatus.complete
    //         ? () {
    //             onItemClick(data.task);
    //           }
    //         : null,
    //     child: Stack(
    //       children: <Widget>[
    //         Container(
    //           width: double.infinity,
    //           height: 64.0,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12.0),
    //               color: isEven
    //                   ? theme.colorScheme.secondary.withOpacity(0.7)
    //                   : theme.colorScheme.secondary.withOpacity(0.4)),
    //           child: Row(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Expanded(
    //                 child: Text(
    //                   data.name,
    //                   maxLines: 1,
    //                   softWrap: true,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 8.0),
    //                 child: _buildActionForTask(data.task),
    //               ),
    //             ],
    //           ),
    //         ),
    //         data.task.status == DownloadTaskStatus.running ||
    //                 data.task.status == DownloadTaskStatus.paused
    //             ? Positioned(
    //                 left: 0.0,
    //                 right: 0.0,
    //                 bottom: 0.0,
    //                 child: LinearProgressIndicator(
    //                   value: data.task.progress / 100,
    //                 ),
    //               )
    //             : Container()
    //       ].where((child) => child != null).toList(),
    //     ),
    //   ),
    // );
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
      default:
        return HelloIcons.document_light_icon;
    }
  }

  Widget _buildActionForTask(_ItemHolder data) {
    _TaskInfo task = data.task;
    if (data.task.itemModel.isAvailable) {
      if (task.status == DownloadTaskStatus.undefined) {
        return RawMaterialButton(
          onPressed: () {
            onAtionClick(task);
          },
          child: Image.asset(
            HelloIcons.download_bold_icon,
            height: 22,
            color: Colors.blue,
          ),
          shape: CircleBorder(),
          constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
        );
      } else if (task.status == DownloadTaskStatus.running) {
        return RawMaterialButton(
          onPressed: () {
            onAtionClick(task);
          },
          child: Icon(
            Icons.pause,
            color: Colors.orange,
          ),
          shape: CircleBorder(),
          constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
        );
      } else if (task.status == DownloadTaskStatus.paused) {
        return RawMaterialButton(
          onPressed: () {
            onAtionClick(task);
          },
          child: Icon(
            Icons.play_arrow,
            color: Colors.green,
          ),
          shape: CircleBorder(),
          constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
        );
      } else if (task.status == DownloadTaskStatus.complete) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RawMaterialButton(
              onPressed: () {
                onAtionClick(task);
              },
              child: Image.asset(
                HelloIcons.tick_bold_icon,
                color: AppColors.kbDarkGreen,
                height: 18,
              ),
              shape: CircleBorder(),
              constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
            )
          ],
        );
      } else if (task.status == DownloadTaskStatus.canceled) {
        return Text('Canceled', style: TextStyle(color: Colors.red));
      } else if (task.status == DownloadTaskStatus.failed) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Failed', style: TextStyle(color: Colors.red)),
            RawMaterialButton(
              onPressed: () {
                onAtionClick(task);
              },
              child: Icon(
                Icons.refresh,
                color: Colors.green,
              ),
              shape: CircleBorder(),
              constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
            )
          ],
        );
      } else if (task.status == DownloadTaskStatus.enqueued) {
        return Text('Pending', style: TextStyle(color: Colors.orange));
      } else {
        return null;
      }
    } else if (data.task.itemModel.documentsType == DocumentsType.PersonalDoc) {
      return RawMaterialButton(
        onPressed: () {
          //TODO: Upload Action
          print("User wants to upload the item");
        },
        child: Image.asset(
          HelloIcons.upload_bold_icon,
          height: 22,
          color: Colors.orange,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class _TaskInfo {
  final String name;
  final String link;
  final DocumentsGroupModel itemModel;

  String taskId;
  int progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  _TaskInfo({this.name, this.link, this.itemModel});
}

class _ItemHolder {
  final String name;
  final _TaskInfo task;
  _ItemHolder({
    this.name,
    this.task,
  });
}
