import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/main.dart';
import 'package:project_gsc/screens/consultant_list.dart';
import 'package:project_gsc/utils/auth.dart';
import 'package:project_gsc/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:project_gsc/repository/product.dart';
import 'package:project_gsc/repository/products_repository.dart';

class Home extends StatefulWidget {
  Home({super.key});

  final User? user = Auth().currentUser;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> logOut() async {
    await Auth().logOut();
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainApp()));
  }

  Widget _logOutButton() {
    return ElevatedButton(
      onPressed: logOut,
      child: const Text(
        'Logout',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  List<Widget> _buildGridCards(BuildContext context, Category category) {
    List<Product> products = ProductsRepository.loadProducts(category);

    if (products.isEmpty) {
      return const <Widget>[];
    }

    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Container(
        color: defaultBackgroundColor,
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ConsultantList()));
          },
          child: Card(
            color: defaultBackgroundColor,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: firstColor, width: 2),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 7 / 4,
                  child: Image.asset(
                    product.assetName,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 16,
                            color: firstColor,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 1.0),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.all(2.0),
                        child: SingleChildScrollView(
                          child: Text(
                            product.desc,
                            style: const TextStyle(
                                fontSize: 12,
                                color: firstColor,
                                fontWeight: FontWeight.w500),
                            maxLines: 20,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        foregroundColor: defaultBackgroundColor,
        toolbarHeight: 60,
        title: const Text(
          'ConsuLawtion',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 32,
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 32,
            icon: const Icon(
              Icons.account_circle_outlined,
              semanticLabel: 'account',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Kategori",
                style: TextStyle(
                  color: blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildGridCards(context, Category.satu),
              ),
            ),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildGridCards(context, Category.dua),
              ),
            ),


            // Logout button
            _logOutButton()
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
