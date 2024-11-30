import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  late String userId;
  RxBool isloading = true.obs;
  final TextEditingController taskController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    userId = FirebaseAuth.instance.currentUser!.uid;
    fetchTasks();
  }

  // Fetch tasks for the current user from database
  void fetchTasks() async {
    try {
      isloading.value = true;
      var taskCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tasks');
      var snapshot = await taskCollection.get();

      tasks.value = snapshot.docs
          .map((doc) => Task(
                title: doc['title'],
                isComplete: doc['isComplete'],
                id: doc.id,
              ))
          .toList();
    } catch (e) {
      Get.snackbar('Error', 'Something Went Wrong!');
    }
    isloading.value = false;
  }

  // Add a new task for the current user
  void addTask(String title) async {
    isloading.value = true;
    try {
      var taskCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tasks');

      var docRef = await taskCollection.add({
        'title': title,
        'isComplete': false,
      });
  
      tasks.add(Task(title: title, isComplete: false, id: docRef.id));
    } catch (error) {
      Get.snackbar('Error', 'Something Went Wrong!');
    }
    isloading.value = false;
  }

  // Toggle completion status of task for the current user
  void toggleCompletion(String taskId) async {
    var taskDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId);
    var taskSnapshot = await taskDoc.get();
    var currentStatus = taskSnapshot['isComplete'];
    taskDoc.update({'isComplete': !currentStatus});

    // Update task locally
    var task = tasks.firstWhere((task) => task.id == taskId);
    task.isComplete = !task.isComplete;
    tasks.refresh();
  }
}
