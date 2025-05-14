import 'package:flutter/material.dart';
import 'package:tu/tu.dart';

mixin TuWorkerMixin<T extends StatefulWidget> on State<T> {
  final List<Worker> _workers = [];

  void tuever<R>(Rx<R> observable, WorkerCallback<R> callback) {
    _workers.add(ever(observable, callback));
  }

  @override
  void dispose() {
    clog("[mixin] cleaning up...");
    for (var worker in _workers) {
      worker.dispose();
    }
    _workers.clear();
    super.dispose();
  }
}
