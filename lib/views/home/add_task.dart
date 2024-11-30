import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/views/Authentication/components/custom_button.dart';
import 'controller.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskController controller = Get.find<TaskController>();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add New Task',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.taskController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  if (controller.taskController.value.text.isNotEmpty) {
                    controller.addTask(controller.taskController.value.text);
                    controller.taskController.clear();
                    Get.back();
                  }
                },
                label: 'Add Task',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
