import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user.profile.model.dart';

class ProfileController extends GetxController {

  RxList<UserProfile> profileContent  = RxList<UserProfile>(
  [
    UserProfile(
      id: 1, 
      name: 'Aurora', 
      email: 'aurora@gmail.com', 
      phoneNumber: '017xx-xxxxxx',
      image: 'https://lumiere-a.akamaihd.net/v1/images/ct_aurora_upcportalreskin_20694_64ebc9aa.jpeg?region=0,0,330,330&width=320',
    ),
    UserProfile(
      id: 2, 
      name: 'Ariel', 
      email: 'ariel@gmail.com', 
      phoneNumber: '017xx-xxxxxx',
      image: 'https://lumiere-a.akamaihd.net/v1/images/ct_ariel_upcportalreskin_20694_09abefbe.jpeg?region=0,0,330,330&width=320',
    ),
    UserProfile(
      id: 3, 
      name: 'Rapunzel', 
      email: 'rapunzel@gmail.com', 
      phoneNumber: '017xx-xxxxxx',
      image: 'https://lumiere-a.akamaihd.net/v1/images/ct_rapunzel_upcportalreskin_20694_01be5a18.jpeg?region=0,0,330,330&width=320',
    ),
    UserProfile(
      id: 4, 
      name: 'Merida', 
      email: 'merida@gmail.com', 
      phoneNumber: '017xx-xxxxxx',
      image: 'https://lumiere-a.akamaihd.net/v1/images/pp_princess_merida_static_mobile_20694_722e7f30.jpeg?region=0%2C0%2C640%2C480',
    ),
    UserProfile(
      id: 5, 
      name: 'Cinderella', 
      email: 'cinderella@gmail.com', 
      phoneNumber: '017xx-xxxxxx',
      image: 'https://lumiere-a.akamaihd.net/v1/images/ct_cinderella_upcportalreskin_20694_f7c876a1.jpeg?region=0,0,330,330',
    ),
    UserProfile(
      id: 6, 
      name: 'Mulan', 
      email: 'mulan@gmail.com', 
      phoneNumber: '017xx-xxxxxx',
      image: 'https://lumiere-a.akamaihd.net/v1/images/ct_mulan_upcportalreskin_20694_78e0045d.jpeg',
    ),
  ]);

  void addProfile(UserProfile page) {
    profileContent.add(page);
    update();
  }
  void removeContact(int index) {
    profileContent.removeAt(index);
    update();
  }
}