class ApiUrls{

  // Base URL for the API
  static const String baseUrl = 'https://api.syedbipul.me';

  // Authentication Endpoints
  static const String registerUrl = '$baseUrl/user/register';
  static const String activateUserUrl = '$baseUrl/user/activate-user';
  static const String loginUrl = '$baseUrl/user/login';

  // User Profile Endpoints
  static const String myProfileUrl = '$baseUrl/user/my-profile';
  static const String updateProfileUrl = '$baseUrl/user/update-profile';


// Task Endpoints
  static const String getAllTasksUrl = '$baseUrl/task/get-all-task';
  static const String createTaskUrl = '$baseUrl/task/create-task';
  static  String deleteTaskUrl(String id) => '$baseUrl/task/delete-task/$id';
  static   String    getTaskUrl(String id) =>'$baseUrl/task/get-task/$id';


}