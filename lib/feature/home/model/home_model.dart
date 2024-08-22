class HomeModel {
  // {message: https://images.dog.ceo/breeds/pug/n02110958_14683.jpg, status: success}
  String status;
  String message;
  HomeModel({required this.message, required this.status});
  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        message: json["message"],
        status: json["status"],
      );
}
