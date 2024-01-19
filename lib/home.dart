// ignore_for_file: await_only_futures, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/customappbar.dart';
import 'package:todo_list/screens/addtask.dart';
import 'package:todo_list/screens/description.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = '';
  @override
  void initState() {
    getuid();
    super.initState();
  }

  getuid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = await auth.currentUser;
    setState(() {
      uid = user!.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        AppTitle: 'To-Do',
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('tasks')
                .doc(uid)
                .collection('mytasks')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                );
              } else {
                final document = snapshot.data?.docs;
                return ListView.builder(
                    itemCount: document?.length,
                    itemBuilder: (context, index) {
                      var time =
                          (document?[index]['timestamp'] as Timestamp).toDate();
                      return Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        padding: const EdgeInsets.all(5),
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: ListTile(
                          title: Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 10),
                              child: Text(document?[index]['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                          subtitle: Expanded(
                            child: Text(DateFormat.yMd().add_jm().format(time),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          trailing: Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Description(
                                                  title: document?[index]
                                                      ['title'],
                                                  description: document?[index]
                                                      ['description'])));
                                    },
                                    child: const Icon(
                                      Icons.description,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: InkWell(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('tasks')
                                          .doc(uid)
                                          .collection('mytasks')
                                          .doc(document?[index]['time'])
                                          .delete();
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                      //Container(
                      //     child: Column(children: [
                      //   Text(document?[index]['title']),
                      // ]));
                    });
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const AddTask())));
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add, color: Colors.white)),
    );
  }
}
