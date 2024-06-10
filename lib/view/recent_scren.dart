import 'package:flutter/material.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

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
          const Text("Today"),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ContactListTile();
                }),
          )
        ],
      ),
    );
  }
}

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 40,
        ),
        title: Text("Sangeet Kursi Sir"),
        subtitle: Row(
          children: [
            Icon(Icons.call_made),
            Text("Mobile"),
            Text(" • "),
            Text("14:34")
          ],
        ),
        trailing: Icon(Icons.phone),
      ),
    );
  }
}
