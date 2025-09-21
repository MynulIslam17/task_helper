import 'package:get/get.dart';
import '../../../core/services/api_services.dart';
import '../../../core/utils/urls/api_urls.dart';
import '../model/task_model.dart';

class AllTaskController extends GetxController {
  String? _errorMsg;
  List<TaskModel> _taskList = [];

  String? get errorMessage => _errorMsg;
  List<TaskModel> get taskList => _taskList;

  /// Fetch all tasks
  Future<bool> retrieveTask() async {
    bool success = false;

    try {
      NetworkResponse response = await NetworkCaller.getRequest(ApiUrls.getAllTasksUrl);

      if (response.success) {
        final tasksData = response.body!["data"]["myTasks"];
        _taskList.clear();

        for (final Map<String, dynamic> task in tasksData) {
          _taskList.add(TaskModel.fromJson(task));
        }

        success = true;
      } else {
        _errorMsg = response.body?["error"] ?? "Something went wrong";
      }
    } catch (e) {
      _errorMsg = "Exception: $e";
    }

    update(); // notify listeners
    return success;
  }

  /// Add a new task
  Future<bool> addTask(String title, String description) async {
    bool success = false;

    try {
      Map<String, dynamic> body = {"title": title, "description": description};
      NetworkResponse response = await NetworkCaller.postRequest(
        url: ApiUrls.createTaskUrl,
        body: body,
      );

      if (response.success) {
        // After adding, refresh list
        await retrieveTask();
        success = true;
      } else {
        _errorMsg = response.body?["error"] ?? "Failed to add task";
      }
    } catch (e) {
      _errorMsg = "Exception: $e";
    }

    update();
    return success;
  }



  /// delete task


  Future<bool> deleteTask(String id) async{
    bool success = false;

    NetworkResponse response =await NetworkCaller.deleteRequest(ApiUrls.deleteTaskUrl(id));

    if(response.success){

      success=true;

    }else{

      _errorMsg=response.body!["message"] ?? " something wrong";

    }


    update();




    return success;



  }






}
