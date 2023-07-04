import 'package:flutter/material.dart';

class Contact {
  String name, email, phone;
  Contact(this.name, this.email, this.phone);
}

class ContactListView extends StatefulWidget {
  const ContactListView({super.key});

  @override
  State<ContactListView> createState() => _ContactListViewState();
}

class _ContactListViewState extends State<ContactListView> {
  List<Contact> contactList = [
    Contact('John Doe', 'john@doe.com', '+1 888 9969'),
    Contact('Jane Smith', 'jane@smith.com', '+1 777 8892'),
    Contact('Alice Johnson', 'alice@wonderland.com', '+1 582 9798'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contactList[index].name),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Contact Details: ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: double.infinity,
                              height: 10.0,
                            ),
                            Text(
                              'Name: ${contactList[index].name}',
                            ),
                            Text('Email: ${contactList[index].email}'),
                            Text('Phone Number: ${contactList[index].phone}'),
                          ],
                        ),
                      );
                    });
              },
            );
          }),
    );
  }
}
