import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Model/Product.dart';

class ProductGridItem extends StatefulWidget {
  final Product product;
  const ProductGridItem({super.key, required this.product});

  @override
  State<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.product.image!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.product.title!,
            maxLines: 2,
            textAlign: TextAlign.left,
          ),

          Row(
            children: [
              Text("\$${widget.product.price.toString()}",
                style: const TextStyle(fontSize: 14,fontWeight:FontWeight.bold ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.black,
                iconSize: 25,
                onPressed: (){

                },
              ),
            ],
          ),
        ],
      ),
    );
  }

}