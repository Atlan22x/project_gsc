import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/main.dart';
import 'package:project_gsc/utils/auth.dart';
import 'package:project_gsc/utils/colors.dart';
import 'package:project_gsc/screens/chatroom.dart';
import 'package:flutter/material.dart';
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

  Future<void> _chatRoom() async {
    if (!context.mounted) return;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ChatRoom()));
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

  Widget _chatRoomButton() {
    return ElevatedButton(
      onPressed: _chatRoom,
      child: const Text(
        'Chat',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  List<Widget> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Widget>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  product.assetName,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 18, color: firstColor, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.all(2.0),
                      child: SingleChildScrollView(
                        child: Text(
                          product.desc,
                          style: const TextStyle(fontSize: 14, color: firstColor, fontWeight: FontWeight.w500),
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {},
        ),
        title: const Text('ConsuLawtion'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _buildGridCards(context),
            ),
          ),

          // Chat button
          _chatRoomButton(),

          // Logout button
          _logOutButton()
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
