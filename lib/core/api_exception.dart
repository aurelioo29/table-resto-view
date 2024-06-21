class ApiException{
  final String message;
  ApiException({required this.message});

  String toString(){
    return message;
  }
}