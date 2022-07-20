import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Connection.dart';

class ModifierPet extends StatefulWidget {
  final String name;
  final String category;
  final String tag;
  final String status;
  final int id;
  const ModifierPet(
      {Key? key,
      required this.name,
      required this.category,
      required this.id,
      required this.tag,
      required this.status})
      : super(key: key);

  @override
  State<ModifierPet> createState() => _ModifierPetState();
}

Connexion connect = Connexion();

class _ModifierPetState extends State<ModifierPet> {
  @override
  Widget build(BuildContext context) {
    TextEditingController myControllername = TextEditingController()
      ..text = widget.name;
    TextEditingController myControllercategory = TextEditingController()
      ..text = widget.category;
    TextEditingController myControllertag = TextEditingController()
      ..text = widget.tag;
    TextEditingController myControllerstatus = TextEditingController()
      ..text = widget.status;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    controller: myControllername,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: TextFormField(
                    controller: myControllercategory,
                    minLines: 1,
                    maxLines: 20,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    controller: myControllertag,
                    minLines: 1,
                    maxLines: 20,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    controller: myControllerstatus,
                    minLines: 1,
                    maxLines: 20,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: MaterialButton(
                    onPressed: () async {
                      print(widget.id);
                      connect.UpdatePet(
                          widget.id,
                          myControllername.text,
                          myControllerstatus.text,
                          myControllercategory.text,
                          myControllertag.text);
                      Navigator.pop(context);
                    },
                    textColor: Colors.white,
                    color: Colors.blueGrey.shade400,
                    elevation: 10,
                    splashColor: Colors.red.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusElevation: 2,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                      child: Text(
                        "Modifier",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
