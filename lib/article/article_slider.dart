import 'package:flutter/material.dart';

class ArticleSlider extends StatefulWidget {
  @override
  _ArticleSliderState createState() => _ArticleSliderState();
}

class _ArticleSliderState extends State<ArticleSlider> {
  final List<Article> articles = [
    Article(
      title: 'Diduga Cabuli Siswa di Sekolah, Guru di Jaksel Dilaporkan ke Polisi',
      description: 'Seorang guru di Jakarta Selatan dilaporkan ke kepolisian karena diduga melakukan pencabulan terhadap siswanya yang masih berusia 13 tahun di sekolah.',
      image: 'assets/article1.jpg',
    ),
    Article(
      title: 'Kuasa Hukum Tegaskan Aiman Punya Hak Tolak Bongkar Identitas Narasumber soal Oknum Polri Tak Netral',
      description: 'Juru Bicara Tim Pemenangan Nasional (TPN) Ganjar-Mahfud, Aiman Witjaksono, menegaskan bahwa dirinya memiliki hak tolak untuk tak memberitahu siapa narasumber yang memberitahunya perihal dugaan polisi tak netral.',
      image: 'assets/article2.jpg',
    ),
    Article(
      title: 'Kuasa Hukum: Siskaeee Seharusnya Masih Rawat Jalan di RSUP Sardjito',
      description: 'Tofan Agung Ginting, salah satu tim penasihat hukum Fransiska Candra Novita Sari alias Siskaeee, mengatakan bahwa kliennya tersebut seharusnya masih rawat jalan untuk mengatasi gangguan mental.',
      image: 'assets/article2.jpg',
    ),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Artikel',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          color: _currentPage == index ? Colors.blue : Colors.grey,
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
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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

  Article({required this.title, required this.description, required this.image});
}