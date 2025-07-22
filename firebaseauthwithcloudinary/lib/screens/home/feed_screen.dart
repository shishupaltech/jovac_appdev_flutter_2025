import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/firestore_service.dart';
import '../../services/cloudinary_service.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feed')),
      body: StreamBuilder(
        stream: FirestoreService.getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index];
              final postId = docs[index].id;
              return Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    if (data['imageUrl'] != null)
                      Image.network(
                        data['imageUrl'],
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ListTile(
                      title: Text(data["text"] ?? ""),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _showEditDialog(
                              context,
                              postId,
                              data['text'],
                              data['imageUrl'],
                            );
                          } else if (value == 'delete') {
                            _deletePost(context,postId);
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(value: 'edit', child: Text('Edit')),
                          PopupMenuItem(value: 'delete', child: Text('Delete')),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _deletePost(BuildContext context, String postId) async {
    await FirestoreService.deletePost(postId);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Post Deleted')));
  }

  void _showEditDialog(
    BuildContext context,
    String postId,
    String? oldText,
    String? oldImageUrl,
  ) {
    final textController = TextEditingController(text: oldText);
    File? newImageFile;
    String? previousImageUrl= oldImageUrl;
    showDialog(
      context: context,
      builder: (_){
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Edit Post'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: 'Edit Post',
                      ),
                    ),
                    SizedBox(height: 10,),
                    if(previousImageUrl != null)
                      Image.network(
                        previousImageUrl?? 'https://craftsnippets.com/articles_images/placeholder/placeholder.jpg',
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                     SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () async{
                        final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if(picked != null){
                          newImageFile = File(picked.path);
                          final newUrl = await CloudinaryService.uploadImage(newImageFile!);
                          setState(() {
                            previousImageUrl = newUrl;

                          });
                        }
                      },
                      child: Text('Pick Image'),
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: ()=>Navigator.pop(context),
                ),
                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () async{
                    final updateData = {
                      'text': textController.text,
                      'imageUrl': previousImageUrl,
                    };
                    await FirestoreService.updatePost(postId, updateData);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
        );
      }
    );
  }
}
