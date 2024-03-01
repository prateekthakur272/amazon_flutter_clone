import 'package:amazon_flutter_clone/models/product.dart';
import 'package:amazon_flutter_clone/screens/admin_screen/add_product.dart';
import 'package:amazon_flutter_clone/screens/admin_screen/widgets/product_view.dart';
import 'package:amazon_flutter_clone/services/admin_service.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;

  void getProducts() async {
    products = await AdminService.getAllProducts(context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return products != null
        ? Scaffold(
            body: Center(
              child: GridView.builder(
                itemCount: products!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) =>
                      ProductView(product: products![index])),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              tooltip: 'Add new product',
              onPressed: () {
                Navigator.pushNamed(context, AddProductScreen.routeName);
              },
              child: const Icon(Icons.add),
            ),
          )
        : const CircularProgressIndicator();
  }
}
