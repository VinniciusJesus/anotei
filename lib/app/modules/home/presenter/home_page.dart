import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:anotei/app/modules/home/presenter/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart' show modular;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  late HomeController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = context.watch<HomeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD9ACF5),
        title: Text(
          'Anotei',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Material(
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () async {
            final result = await showTextInputDialog(
              context: context,
              textFields: [DialogTextField(hintText: "Título")],
            );

            if (result != null) {
              _controller.titleEC.text = result.first;
              _controller.add();
            }
          },
          child: Ink(
            width: 56.0,
            height: 56.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              color: Color(0xFFD9ACF5),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFFFCEFE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Procurar",
                    suffixIcon: Icon(
                      Icons.search,
                      size: 35,
                    ),
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 600,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _controller.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _controller.list[index];
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        Slidable(
                          key: UniqueKey(),
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                icon: Icons.delete,
                                backgroundColor: Colors.red.shade300,
                                borderRadius: BorderRadius.circular(12),
                                onPressed: (BuildContext context) {},
                              )
                            ],
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9ACF5),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: item.finish,
                                    onChanged: (value) {},
                                  ),
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
