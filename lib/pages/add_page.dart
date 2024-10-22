import 'package:adopt_app/widgets/add_form.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Pet"),
      ),
      resizeToAvoidBottomInset: false,
      body: AddForm(),

      //    Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       children: [
      //         TextFormField(
      //           controller: titleController,
      //           decoration: const InputDecoration(
      //             hintText: 'Pet name',
      //           ),
      //           validator: (value) {
      //             if (value == null || value.isEmpty) {
      //               return "Please fill out this field";
      //             } else {
      //               return null;
      //             }
      //           },
      //         ),

      //      ElevatedButton(
      // onPressed: () {
      //             _formKey.currentState!.validate();
      // },
      //     child: const Text("Add Book"),
      // ),

      //       ],
      //     ),
      //   ),
    );
  }
}

// class UpdatePage extends StatelessWidget {
//   final Book book;
//   const UpdatePage({Key? key, required this.book}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Update a book"),
//       ),
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             const Text("Fill those field to update a book"),
//             UpdateBookForm(
//               book: book,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
