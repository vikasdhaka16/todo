import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_task.dart';
import '../../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Home - Task Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() => controller.isloading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Column(
              children: [
                Obx(() {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        var task = controller.tasks[index];
                        return Card(
                          surfaceTintColor: Colors.transparent,
                          color: Colors.white,
                          elevation: 3,
                          child: ListTile(
                            title: Text(task.title.capitalizeFirst!),
                            trailing: Checkbox(
                              value: task.isComplete,
                              activeColor: Colors.blueGrey,
                              onChanged: (_) {
                                controller.toggleCompletion(task.id);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                })
              ],
            )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Get.to(() => AddTaskScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
