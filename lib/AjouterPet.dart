import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Connection.dart';

class AjouterPet extends StatefulWidget {
  const AjouterPet({Key? key}) : super(key: key);

  @override
  State<AjouterPet> createState() => _AjouterPetState();
}

class _AjouterPetState extends State<AjouterPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: ListTile(
                    leading: IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
              ),
              MyCustomForm(),
            ],
          ),
        ),
      ),
    );
  }
}

Connexion connect = Connexion();

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController myControllername = TextEditingController();
  TextEditingController myControllercategory = TextEditingController();
  TextEditingController myControllertag = TextEditingController();
  TextEditingController myControllerStatus = TextEditingController();
  TextEditingController myControllerid = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: myControllerid,
              decoration: const InputDecoration(
                hintText: 'Enter the pet ID',
                labelText: 'ID',
              ),
            ),
            TextFormField(
              controller: myControllername,
              decoration: const InputDecoration(
                hintText: 'Enter the pet name',
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: myControllercategory,
              decoration: const InputDecoration(
                hintText: 'Enter the name of the category',
                labelText: 'Category Name',
              ),
            ),
            TextFormField(
              controller: myControllertag,
              decoration: const InputDecoration(
                hintText: 'Enter the name of the tag',
                labelText: 'Tag Name',
              ),
            ),
            TextFormField(
              controller: myControllerStatus,
              decoration: const InputDecoration(
                hintText: 'available / pending / sold',
                labelText: 'Status',
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .4,
                  child: ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      connect.AddPet(
                        myControllerid.text,
                        myControllername.text,
                        myControllerStatus.text,
                        /* myControllercategory.text,
                          myControllertag.text */
                      );
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
