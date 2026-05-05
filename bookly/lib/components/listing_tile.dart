import 'package:bookly/models/listing_model.dart';
import 'package:flutter/cupertino.dart';

class ListingTile extends StatefulWidget {
  
  final ListingModel listingObj;

  const ListingTile({
    super.key,
    required this.listingObj
  });

  @override
  State<ListingTile> createState() => _ListingTileState();
}

class _ListingTileState extends State<ListingTile> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      //TODO:Change this to image.network when actually hosted
      // child: Image.network(widget.listingObj.imageUrl)
      child: Image.asset(widget.listingObj.imageUrl)
    );
  }
}