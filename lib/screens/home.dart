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
  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

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
          fontSize: 18,
          fontWeight: FontWeight.w500
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
              Icons.account_circle_outlined,
              semanticLabel: 'account',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
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

                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Artikel',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 4.0),
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
                // Logout button
                _logOutButton()
              ],
            ),
          ),
          const ChatRoom(),
          const screens.Notification(),
        ],
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                color: defaultBackgroundColor,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(
                Icons.chat,
                color: defaultBackgroundColor,
              ),
              label: 'Chat'),
          NavigationDestination(
              icon: Icon(
                Icons.notifications,
                color: defaultBackgroundColor,
              ),
              label: 'Notifications')
        ],
        onDestinationSelected: navigationTapped,
        backgroundColor: firstColor,
        indicatorColor: Colors.grey,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _page,
        height: 60,
      ),
    );
  }
}

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
