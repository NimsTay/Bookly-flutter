class ListingModel {
  final String businessName;
  final double rating;
  final String city;
  final int zip;
  final String category;
  //TODO: get from backend url
  final String imageUrl;

  ListingModel({
    required this.businessName,
    required this.rating,
    required this.city,
    required this.zip,
    required this.category,
    required this.imageUrl
  });

  
}