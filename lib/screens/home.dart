import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_gsc/main.dart';
import 'package:project_gsc/screens/chatroom.dart';
import 'package:project_gsc/screens/consultant_list.dart';
import 'package:project_gsc/screens/notification.dart' as screens;
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
                Container(
                  padding: const EdgeInsets.all(8),
                  child: AspectRatio(
                    aspectRatio: 7 / 4,
                    child: Image.asset(
                      product.assetName,
                      fit: BoxFit.fitHeight,
                    ),
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
                            color: blackColor,
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
                                color: greyColor,
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

  final List<Article> articles = [
    Article(
      title:
          'Diduga Cabuli Siswa di Sekolah, Guru di Jaksel Dilaporkan ke Polisi',
      description:
          'Seorang guru di Jakarta Selatan dilaporkan ke kepolisian karena diduga melakukan pencabulan terhadap siswanya yang masih berusia 13 tahun di sekolah.',
      image: 'assets/article1.jpg',
    ),
    Article(
      title:
          'Kuasa Hukum Tegaskan Aiman Punya Hak Tolak Bongkar Identitas Narasumber soal Oknum Polri Tak Netral',
      description:
          'Juru Bicara Tim Pemenangan Nasional (TPN) Ganjar-Mahfud, Aiman Witjaksono, menegaskan bahwa dirinya memiliki hak tolak untuk tak memberitahu siapa narasumber yang memberitahunya perihal dugaan polisi tak netral.',
      image: 'assets/article2.jpg',
    ),
    Article(
      title:
          'Kuasa Hukum: Siskaeee Seharusnya Masih Rawat Jalan di RSUP Sardjito',
      description:
          'Tofan Agung Ginting, salah satu tim penasihat hukum Fransiska Candra Novita Sari alias Siskaeee, mengatakan bahwa kliennya tersebut seharusnya masih rawat jalan untuk mengatasi gangguan mental.',
      image: 'assets/article3.jpg',
    ),
  ];

  int _currentPage = 0;

  void popupValueHandler(Menu menu) {
    if (menu == Menu.profile) {
    } else if (menu == Menu.privacy) {
    } else if (menu == Menu.language) {
    } else if (menu == Menu.theme) {
    } else if (menu == Menu.logout) {
      logOut();
    }
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
            PopupMenuButton(
              elevation: 0,
              padding: const EdgeInsets.all(4),
              color: defaultBackgroundColor,
              position: PopupMenuPosition.under,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                side: BorderSide(color: firstColor, width: 1),
              ),
              itemBuilder: (context) => <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  value: Menu.profile,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Informasiku",
                        style: TextStyle(fontSize: 18, color: blackColor),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      ListTile(
                        iconColor: greyColor,
                        textColor: greyColor,
                        dense: true,
                        leading: Icon(Icons.person_outline),
                        title: Text('Profilku'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.privacy,
                  child: ListTile(
                    iconColor: greyColor,
                    textColor: greyColor,
                    dense: true,
                    leading: Icon(Icons.lock_outline),
                    title: Text('Privasi'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                const PopupMenuDivider(height: 20),
                const PopupMenuItem<Menu>(
                  value: Menu.theme,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Pengaturan",
                        style: TextStyle(fontSize: 18, color: blackColor),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      ListTile(
                        iconColor: greyColor,
                        textColor: greyColor,
                        dense: true,
                        leading: Icon(Icons.language),
                        title: Text('Bahasa'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.language,
                  child: ListTile(
                    iconColor: greyColor,
                    textColor: greyColor,
                    dense: true,
                    leading: Icon(Icons.dark_mode_outlined),
                    title: Text('Tampilan'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                const PopupMenuDivider(height: 20),
                const PopupMenuItem<Menu>(
                  value: Menu.logout,
                  child: ListTile(
                    iconColor: greyColor,
                    textColor: greyColor,
                    dense: true,
                    leading: Icon(Icons.logout),
                    title: Text('Keluar'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ],
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 36,
              ),
              onSelected: (value) {
                popupValueHandler(value);
              },
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: firstColor),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 54,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  filled: true,
                  fillColor: defaultBackgroundColor,
                  hintText: 'Telusuri Konsultan',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Kategori",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12,),
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
            const SizedBox(height: 12,),
            SizedBox(
              width: double.infinity,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      'Artikel',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: articles.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return ArticleCard(
                              article: articles[index],
                            );
                          },
                        ),
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              articles.length,
                              (index) => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                width: _currentPage == index ? 12.0 : 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPage == index
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Menu { profile, privacy, language, theme, logout }

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(article.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(
                  article.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Article {
  final String title;
  final String description;
  final String image;

  Article(
      {required this.title, required this.description, required this.image});
}
