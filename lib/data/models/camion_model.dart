class CamionModel{
  final int? id;
  final String branch;
  final String capacity_load;
  final String model;
  final String fuel_type;

  CamionModel(
      {required this.id,
        required this.branch,
        required this.capacity_load,
        required this.model,
        required this.fuel_type});

  factory CamionModel.fromJson(Map<String,dynamic> json){
   return CamionModel(
      id: json["id"],
      branch: json["branch"],
      capacity_load: json["capacity_load"] ,
      model: json["model"],
      fuel_type: json["fuel_type"]  // Assuming 'fuel_type' is always present in JSON object. If it might be missing, add a default value or use a nullable type.
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branch': branch,
      'capacity_load': capacity_load,
     'model': model,
      'fuel_type': fuel_type
    };
  }


}