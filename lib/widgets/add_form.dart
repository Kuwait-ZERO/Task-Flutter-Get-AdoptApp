import 'dart:io';

import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  _AddPetFormState createState() => _AddPetFormState();
}

class _AddPetFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  int age = 0;
  String gender = "";
  var _image;
  final _picker = ImagePicker();
  // Add your form fields' controllers or state here
  // TextEditingController _nameController = TextEditingController();

  // @override
  // void dispose() {
  //   // Dispose controllers when the widget is removed from the tree
  //   _nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Pet name',
              ),
              maxLines: null,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please fill out this field";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                name = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Pet Age',
              ),
              maxLines: null,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please fill out this field";
                } else if (int.tryParse(value) == null) {
                  return "Enter a number";
                }
                return null;
              },
              onSaved: (value) {
                age = int.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Pet gender',
              ),
              maxLines: null,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please fill out this field";
                } else if (value != "male" && value != "female") {
                  return "Enter a gender";
                }
                return null;
              },
              onSaved: (value) {
                gender = value!;
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() == true) {
                    _formKey.currentState!.save();

                    Provider.of<PetsProvider>(context, listen: false).createPet(
                        Pet(
                            name: name,
                            age: age,
                            image: _image.path,
                            gender: gender));
                    GoRouter.of(context).pop();
                  }
                },
                child: const Text("Add Pet"),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      _image = File(image!.path);
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(color: Colors.blue[200]),
                    child: _image != null
                        ? Image.network(
                            _image.path,
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.fitHeight,
                          )
                        : Container(
                            decoration: BoxDecoration(color: Colors.blue[200]),
                            width: 200,
                            height: 200,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Tap to Select Image",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
