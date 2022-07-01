// ignore_for_file: prefer_collection_literals, unnecessary_new
class ImageModel {
  int? imagesId;
  String? imagesTitle;
  String? imagesDescription;
  String? imagesName;
  int? imageUsers;

  ImageModel({
    this.imagesId,
    this.imagesTitle,
    this.imagesDescription,
    this.imagesName,
    this.imageUsers,
  });

  ImageModel.fromJson(Map<String, dynamic> json) {
    imagesId = json['images_id'];
    imagesTitle = json['images_title'];
    imagesDescription = json['images_description'];
    imagesName = json['images_name'];
    imageUsers = json['image_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images_id'] = imagesId;
    data['images_title'] = imagesTitle;
    data['images_description'] = imagesDescription;
    data['images_name'] = imagesName;
    data['image_users'] = imageUsers;
    return data;
  }
}
