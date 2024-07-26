import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/managinguser_controller/searchuserbyname_controller.dart'; // Adjust import path as per your project structure

class SearchUserByName extends StatelessWidget {
  final SearchUserByNameController controller = Get.put(SearchUserByNameController());

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search by name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    String searchQuery = searchController.text.trim();
                    if (searchQuery.isNotEmpty) {
                      controller.fetchUsersByName(searchQuery);
                    } else {
                      // Handle empty search query if needed
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.loading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.users.isEmpty) {
                return Center(child: Text('No users found.'));
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) {
                      var user = controller.users[index];
                      return ListTile(
                        title: Text('${user["first_name"]} ${user["last_name"]}'),
                        subtitle: Text(user["email"]),
                        // Add more fields as needed
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
