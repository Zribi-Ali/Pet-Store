import 'package:flutter/material.dart';
import 'package:pettore/Connection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AjouterPet.dart';
import 'ModifierPet.dart';

class ShopeList extends StatefulWidget {
  const ShopeList({Key? key}) : super(key: key);

  @override
  State<ShopeList> createState() => _ShopeListState();
}

class _ShopeListState extends State<ShopeList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Connexion connect = Connexion();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: connect.fetchPets(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var currentpets = snapshot.data![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Pet(currentpets),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => AjouterPet()),
            ),
          );
        },
        backgroundColor: Colors.blueGrey,
        child: const FaIcon(
          FontAwesomeIcons.plus,
        ),
      ),
    );
  }

  Widget CardPets(data) {
    return Card(
      elevation: 40,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: Stack(children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FlutterLogo(size: 160),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  data["name"],
                  style: const TextStyle(fontSize: 20),
                ),
                data["category"] != null
                    ? Text(
                        data["category"]["name"],
                        style: const TextStyle(fontSize: 20),
                      )
                    : Container(),
                data["tags"] != null ? tages(data["tags"]) : Container(),
                Text(
                  data["status"],
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget tages(data) {
    for (var i = 0; i < data.length; i++) {
      return Column(
        children: [
          data[i]["name"] != null
              ? Text(
                  data[i]["name"],
                  style: const TextStyle(fontSize: 22),
                )
              : Container()
        ],
      );
    }
    return Container();
  }

  Widget PestCAcrd(data) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .33,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const FlutterLogo(size: 140),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  color: Colors.black26,
                  height: MediaQuery.of(context).size.height * .25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Name : ",
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        Text(
                          data["name"],
                          style: const TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    data["category"] != null && data["category"]["name"] != null
                        ? Row(
                            children: [
                              const Text(
                                "Category : ",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black54),
                              ),
                              Text(
                                data["category"]["name"],
                                style: const TextStyle(fontSize: 22),
                              ),
                            ],
                          )
                        : Container(),
                    data["tags"] != null
                        ? Row(
                            children: [
                              const Text(
                                "Tag : ",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black54),
                              ),
                              tages(data["tags"]),
                            ],
                          )
                        : Container(),
                    Row(
                      children: [
                        const Text(
                          "Status : ",
                          style: TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        Text(
                          data["status"],
                          style: const TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              color: Colors.black26,
              width: MediaQuery.of(context).size.width * .8,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.red,
                  size: 19,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Pet(data) {
    var category = "";
    var tag = "";
    if (data["category"] != null) {
      if (data["category"]["name"] != null) {
        category = data["category"]["name"];
      }
    }

    if (data["tags"] != null) {
      if (data["tags"].isNotEmpty) {
        if (data["tags"][0] != null) {
          if (data["tags"][0]["name"] != null) {
            tag = data["tags"][0]["name"];
          }
        }
      }
    }
    String img = "";
    if (data['photoUrls'] != null) {
      if (data["photoUrls"].isNotEmpty && data["photoUrls"].length > 7) {
        if (data['photoUrls'][0] != null) {
          Uri uri = Uri.parse(data['photoUrls'][0]);
          String typeString =
              uri.path.substring(uri.path.length - 3).toLowerCase();
          if (typeString == "jpg" || typeString == "png") {
            img = data['photoUrls'][0];
            print(data['photoUrls'][0]);
          }
        }
      }
    }

    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blueGrey, width: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 10,
      shadowColor: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => ModifierPet(
                                          name: data['name'],
                                          category: category,
                                          id: data["id"],
                                          tag: tag,
                                          status: data["status"],
                                        )),
                                  ),
                                );
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.filePen,
                                color: Colors.blue.shade300,
                              ),
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.trashCan,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(context, data),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Name : ",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                          Text(
                            data["name"],
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Category : ",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                          Text(
                            category,
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Tag : ",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                          Text(
                            tag,
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Status : ",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                          Text(
                            data["status"],
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  img != "" ? Image.network(img) : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context, data) {
    return AlertDialog(
      title: const Text('Vous être sûre ?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              connect.deletePet(data["id"]);
              setState(() {});
              Navigator.of(context).pop();
            },
            child: const Text(
              "Supprimer",
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
//Text(data["category"]["name"], style: const TextStyle(fontSize: 20),),