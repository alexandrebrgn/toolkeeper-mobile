enum Status { COMPLETED, ERROR, BUSY }

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status,this.data,this.message);

  @override
  String toString() {
    return "ApiResponse - toString() :\n Status : $status \n Message : $message \n Data : $data";
  }
}

