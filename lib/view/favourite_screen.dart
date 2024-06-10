import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platformconvertor/globals/global.dart';
import 'package:image_picker/image_picker.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  XFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                fillColor: Colors.white10,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: "Search contacts",
                suffix: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.mic,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text("Favourites"),
              const Spacer(),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          width: double.infinity,
                          color: Colors.white10,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  ImagePicker picker = ImagePicker();
                                  XFile? image = await picker.pickImage(
                                      source: ImageSource.camera);
                                  if (image!.path.isNotEmpty && image != null) {
                                    setState(() {
                                      pickedFile = image;
                                    });
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 40,
                                  child: pickedFile == null
                                      ? Image.network(
                                          "https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D")
                                      : Image.file(
                                          File(pickedFile!.path),
                                        ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favContact.length,
                itemBuilder: (context, index) {
                  return FavCircleAvatar(
                      favContact[index]["image"], favContact[index]["name"]);
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Frequents",
            style: TextStyle(color: Colors.blue, fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

Padding FavCircleAvatar(String imagePath, String contactName) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(imagePath),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(contactName),
      ],
    ),
  );
}
