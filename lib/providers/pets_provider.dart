import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/services/pets.dart';
import 'package:flutter/material.dart';

class PetsProvider extends ChangeNotifier {
  List<Pet> pets = [
    Pet(
        name: "Lucifurr",
        image: "https://i.ibb.co/P6VJ4pZ/smile-cat-1.png",
        age: 2,
        gender: "male")
  ];

  Future getPets() async {
    pets = await DioClient().getPets();
    notifyListeners();
    return pets;
  }

  void createPet(Pet pet) async {
    Pet newPet = await DioClient().createPet(pet: pet);
    pets.insert(0, newPet);
    notifyListeners();
  }

  void updatePet(Pet pet) async {
    Pet newPet = await DioClient().updatePet(pet: pet);
    int index = pets.indexWhere((pet) => pet.id == newPet.id);
    pets[index] = newPet;
    notifyListeners();
  }
  //  void adoptPet(int petId) async {
  //   Pet newPet = await DioClient().adoptPet(petId: petId);
  //   int index = pets.indexWhere((pet) => pet.id == newPet.id);
  //   pets[index] = newPet;
  //   notifyListeners();
  // }

  //  void deletePet(int petId) async {
  //   await DioClient().deletePet(petId: petId);
  //   pets.removeWhere((pet) => pet.id == petId);
  //   notifyListeners();
  // }
}
