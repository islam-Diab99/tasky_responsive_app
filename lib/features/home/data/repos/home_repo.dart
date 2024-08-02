import 'package:tasky/Core/networking/api_error_handler.dart';
import 'package:tasky/Core/networking/api_result.dart';
import 'package:tasky/Core/networking/api_service.dart';
import 'package:tasky/features/home/data/models/todo_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<List<TodoResponse>>> getTodoList(pageNum) async {
    try {
      final response = await _apiService.getTodosList(pageNum);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult> deleteTaskById(id) async {
    try {
       await _apiService.deleteTodoById(id);
      return const ApiResult.success(null);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
