import 'package:flutter/material.dart';
import 'package:flutter_practice/profile.controller.dart';
import 'package:flutter_practice/user.profile.model.dart';
import 'package:get/get.dart';
import 'constant.dart';
import 'profile.controller.dart';
import 'profile.details.dart';

// ignore: must_be_immutable
class ContactsScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  late int lastIndex = 0;

  ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Gmail Contacts'),
          ),
          body: Obx(
            () => ListView.builder(
              itemCount: profileController.profileContent.length,
              itemBuilder: (BuildContext context, int index) {
                var person = profileController.profileContent[index];
                lastIndex = index;
                return Card(
                  child: TextButton(
                    onPressed: () {
                      Get.to(ProfileDetails(
                        index: index,
                      ),);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(person.image),
                      ),
                      title: Text(person.name),
                      subtitle: Text(person.email),
                      trailing: IconButton(
                        onPressed: (){
                          profileController.removeContact(index);
                        }, 
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: (){
              late String name;
              late String email;
              late String phoneNumber;
              late String imageURL;
              Get.defaultDialog(
                title: 'Add Contacts',
                content: Column(
                  children: [
                    TextField(
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Image URL',
                        icon: const Icon(Icons.photo),
                      ),
                      onChanged: (value){
                        imageURL = value;
                      },
                    ),
                    TextField(
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Name',
                        icon: const Icon(Icons.person),
                      ),
                      onChanged: (value){
                        name = value;
                      },
                    ),
                    TextField(
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'example@mail.com',
                        icon: const Icon(Icons.email),
                      ),
                      onChanged: (value){
                        email = value;
                      },
                    ),
                    TextField(
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: '01***-******',
                        icon: const Icon(Icons.phone),
                      ),
                      onChanged: (value){
                        phoneNumber = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: (){
                      profileController.addProfile(
                        UserProfile(
                          email: email, 
                          id: lastIndex+1, 
                          image: imageURL, 
                          name: name, 
                          phoneNumber: phoneNumber,
                        ),
                      );
                      Get.back();
                    }, 
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}