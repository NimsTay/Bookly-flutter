import 'package:bookly/models/listing_model.dart';
import 'package:flutter/cupertino.dart';

class ListingController extends ChangeNotifier {
  
  List<ListingModel> _retrievedListings = [];
  List<ListingModel> get retrievedListings => _retrievedListings;

  

  List<ListingModel> getListings(String cat) {
    //TODO:call backend instead and find how to make an infinite scroll where it hits backend again to paginate
    List<ListingModel> retrievedListings = [];
    retrievedListings.add(ListingModel(
      businessName: "Golden Heart Tattoo",
      rating: 2.3,
      city: "knoxville",
      zip: 37932,
      category: "tatoo",
      imageUrl: 'assets/tattoo_stock.jpg'
    ));
    retrievedListings.add(ListingModel(
      businessName: "Blue Ridge Plumbing Co.",
      rating: 4.6,
      city: "asheville",
      zip: 28801,
      category: "plumbing",
      imageUrl: 'assets/tattoo_stock.jpg'
    ));

    retrievedListings.add(ListingModel(
      businessName: "Spark Electric Solutions",
      rating: 3.9,
      city: "raleigh",
      zip: 27601,
      category: "electrician",
      imageUrl: 'assets/tattoo_stock.jpg'
    ));

    retrievedListings.add(ListingModel(
      businessName: "Clean Sweep Services",
      rating: 4.2,
      city: "charlotte",
      zip: 28202,
      category: "cleaning",
      imageUrl: 'assets/tattoo_stock.jpg'
    ));

    retrievedListings.add(ListingModel(
      businessName: "Precision Auto Repair",
      rating: 4.8,
      city: "nashville",
      zip: 37203,
      category: "auto",
      imageUrl: 'assets/tattoo_stock.jpg'
    ));

    retrievedListings.add(ListingModel(
      businessName: "Green Leaf Landscaping",
      rating: 3.7,
      city: "atlanta",
      zip: 30303,
      category: "landscaping",
      imageUrl: 'assets/tattoo_stock.jpg'
    ));
    return retrievedListings;
  }
}