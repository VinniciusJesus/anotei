import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../domain/model/item_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    get();
  }
  List<ItemModel> list = [];

  final _firestore = FirebaseFirestore.instance;

  final titleEC = TextEditingController();
  final EC = TextEditingController();

  void search() {

  }

  Future<void> get() async {
    list.clear();
    final result = await _firestore.collection("lista").get();
    result;
    result.docs.forEach(
      (element) {
        list.add(ItemModel(
            title: element["title"],
            id: element.id,
            finish: element["finish"]));
      },
    );

    notifyListeners();
  }

  Future<void> add() async {
    await _firestore
        .collection("lista")
        .doc()
        .set({"title": titleEC.text, "finish": false});

    await get();
  }

  Future<void> remove(String id) async {
    await _firestore.collection("lista").doc(id).delete();
    await get();
  }
}
