import 'package:adopt_app/providers/pets_provider.dart';
import 'package:adopt_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Adopt"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to add a new pet
                  GoRouter.of(context).push('/add');
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Add a new Pet"),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<PetsProvider>(context, listen: false).getPets();
              },
              child: const Text("GET"),
            ),
            FutureBuilder(
              future:
                  Provider.of<PetsProvider>(context, listen: false).getPets(),
              builder: (context, datasnapshot) {
                if (datasnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (datasnapshot.hasError) {
                  return Center(
                    child: Text(datasnapshot.error.toString()),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height),
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Provider.of<PetsProvider>(context).pets.length,
                    itemBuilder: (context, index) => PetCard(
                        pet: Provider.of<PetsProvider>(context).pets[index]),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
