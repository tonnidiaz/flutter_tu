import "dart:io";
import "dart:isolate";
import "dart:ui";
import "package:flutter_downloader/flutter_downloader.dart";
import "package:path_provider/path_provider.dart";
import "package:tu/controllers/commom.ctrl.dart";
import "package:flutter/material.dart";
import "../functions.dart";
import "../tu.dart";
import 'package:get/get.dart';

class UpdatesView3 extends StatefulWidget {
  final Map<String, dynamic>? update;
  final String appName;
  const UpdatesView3({super.key, required this.update, required this.appName});

  @override
  State<UpdatesView3> createState() => UpdatesView3State();
}

class UpdatesView3State extends State<UpdatesView3> {
  final TuProgressCtrl _ctrl = Get.find();
  final ReceivePort _port = ReceivePort();

  String? _taskId;

  _initFlutterDownloader() {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, "downloader_send_port");
    _port.listen((dynamic data) {
      //This is where you handle the outcome/progress
      int progress = data[2];
      clog(progress);
      _ctrl.setProgress(progress / 100);
      if (progress == 100) {
        //Finished downloading
        gpop(); //HIDE DOWNLOADER PROGRESS SHEET
        clog("Opening file");
        FlutterDownloader.open(taskId: _taskId!);
        // HIDE MAIN SHEET
      }
    }, onDone: () {
      clog('IS DONE');
    }, onError: (err) {
      clog(err);
      gpop();
      showToast('Failed to update app', isErr: true).show(context);
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @pragma("vm:entry-point")
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName("downloader_send_port");
    send?.send([id, status, progress]);
  }

  Future<void> _downloadUpdate() async {
    // _checkUpdates()
    //

    try {
      final hasPermission = await requestStoragePermission();
      clog("Has perm: $hasPermission");
      if (!hasPermission) {
        if (!context.mounted) return;
        showToast("Need to have storage permissions", isErr: true)
            .show(context);
        return;
      }

      _ctrl.setProgress(0);
      showProgressSheet(
          msg: "Downloading updates...",
          dismissable: true,
          onDismiss: FlutterDownloader.cancelAll);

      final dir = await getExternalStorageDirectory();

      final dirPath = "${dir?.path}/Downloads/APKs";
      final pdir = Directory(dirPath);
      if (!pdir.existsSync()) {
        clog("Creating directory");
        pdir.createSync(recursive: true);
      }
      clog(dirPath);
      final fileName =
          "${widget.appName}-${DateTime.now().millisecondsSinceEpoch}-v${widget.update!["version"]}.apk";

      final taskId = await FlutterDownloader.enqueue(
        url: widget.update!["file"],
        //"https://github.com/tonnidiaz/tunedapps/releases/download/taudmod-v0.1.0/taudmod-v0.1.0.apk",
        headers: {}, // optional: header send with url (auth token etc)
        savedDir: dirPath,
        fileName: fileName,
        saveInPublicStorage: true,
        showNotification:
            false, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );
      setState(() {
        _taskId = taskId;
      });
    } catch (e) {
      clog(e);
    }
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid || Platform.isIOS) _initFlutterDownloader();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {});
  }

  @override
  void dispose() {
    if (FlutterDownloader.initialized) {
      FlutterDownloader.cancelAll();
      IsolateNameServer.removePortNameMapping("downloader_send_port");
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TuBottomSheet(
      child: widget.update == null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Your version is up-to-date ✓",
                  style: styles.h4(),
                ),
              ],
            )
          : SingleChildScrollView(
              child: tuColumn(min: true, children: [
                Text(
                  "Updates available",
                  style: styles.h3(),
                ),
                mY(8),
                tuTableRow(const Text("Version:"),
                    Text("${widget.update!["version"]}")),
                mY(10),
                Text(
                  "Release notes",
                  style: styles.h4(),
                ),
                Padding(
                  padding: defaultPadding,
                  child: tuColumn(children: [
                    ...widget.update!["notes"]
                        .map((e) => bulletItem(e))
                        .toList()
                  ]),
                ),
                TuButton(
                  bgColor: colors.success,
                  width: double.infinity,
                  color: Colors.white,
                  text: "UPDATE NOW",
                  onPressed: () async {
                    //  gpop();
                    _downloadUpdate();
                  },
                )
              ]),
            ),
    );
  }
}
