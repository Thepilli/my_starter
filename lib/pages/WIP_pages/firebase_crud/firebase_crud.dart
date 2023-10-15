import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:starter_kit/pages/WIP_pages/firebase_crud/dialogbox_provider.dart';
import 'package:starter_kit/pages/WIP_pages/firebase_crud/services.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';

class FirebaseCrud extends ConsumerWidget {
  const FirebaseCrud({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FirestoreService firestoreService = FirestoreService();

    //open a dialog box to add a new note item
    void openNoteBox({String? docID}) {
      TextEditingController textController = ref.watch(textControllerProvider);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (docID == null) {
                  firestoreService.addNote(textController.text);
                  context.pop();
                } else {
                  firestoreService.updateNote(docID, textController.text);
                  context.pop();
                }
              },
              child: const Text('add'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: StreamBuilder(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          //if data is available, get all data
          // enforcing null safety
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (BuildContext context, int index) {
                //get individual docs
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                //get 'note' value from each doc
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                Timestamp t = data['timestamp'] as Timestamp;
                String datestamp = DateFormat.MMMMEEEEd().format(t.toDate());
                return ListTile(
                    title: Text(data['note']),
                    subtitle: Text(datestamp),
                    trailing: PullDownButton(
                      itemBuilder: (context) => [
                        PullDownMenuItem(
                          onTap: () {},
                          title: 'Pin',
                          icon: CupertinoIcons.pin,
                        ),
                        PullDownMenuItem(
                          title: 'Forward',
                          subtitle: 'Share in different channel',
                          onTap: () {},
                          icon: CupertinoIcons.arrowshape_turn_up_right,
                        ),
                        PullDownMenuItem(
                          onTap: () {},
                          title: 'Delete',
                          isDestructive: true,
                          icon: CupertinoIcons.delete,
                        ),
                      ],
                      buttonBuilder: (context, showMenu) => CupertinoButton(
                        onPressed: showMenu,
                        padding: EdgeInsets.zero,
                        child: const Icon(CupertinoIcons.ellipsis_circle),
                      ),
                    )
                    // trailing: PopupMenuButton(
                    //   icon: const Icon(Icons.settings),
                    //   itemBuilder: (context) => [
                    //     PopupMenuItem(
                    //       onTap: () => firestoreService.deleteNote(docID),
                    //       child: const Row(
                    //         children: [
                    //           Icon(Icons.delete_forever),
                    //           Text('Delete'),
                    //         ],
                    //       ),
                    //     ),
                    //     PopupMenuItem(
                    //       onTap: () => openNoteBox(docID: docID),
                    //       child: const Row(
                    //         children: [
                    //           Icon(Icons.edit_outlined),
                    //           Text('Edit'),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    );
              },
            );
          }
          return const Center(
            child: Text('SOmething went wrong'),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Firebase CRUD'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(),
        backgroundColor: context.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
