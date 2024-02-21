import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.satu,
        id: 0,
        isFeatured: true,
        name: 'Perdata',
        desc: 'Perjanjian Kontrak, Warisan dan Pewarisan, Perceraian dan Masalah Keluarga, Gugatan Perdata',
        imageName: 'perdata',
      ),
      Product(
        category: Category.satu,
        id: 1,
        isFeatured: true,
        name: 'Pidana',
        desc: 'Pembelaan Terhadap Tuntutan Pidana, Kasus Kriminal, Hak Asasi Manusia',
        imageName: 'pidana',
      ),
      Product(
        category: Category.satu,
        id: 2,
        isFeatured: false,
        name: 'Bisnis',
        desc: 'Pendirian Usaha dan Perusahaan, Kepailitan dan Penyelesaian Utang, Perjanjian Bisnis',
        imageName: 'bisnis',
      ),
      Product(
        category: Category.satu,
        id: 3,
        isFeatured: true,
        name: 'Ketenagakerjaan',
        desc: 'Kontrak Kerja, Penyelesaian Sengketa Ketenagakerjaan, Perlindungan Pekerja',
        imageName: 'ketenagakerjaan',
      ),
      Product(
        category: Category.satu,
        id: 4,
        isFeatured: false,
        name: 'Lingkungan',
        desc: 'Izin Lingkungan, Sengketa Lingkungan, Kepatuhan Lingkungan',
        imageName: 'lingkungan',
      ),
      Product(
        category: Category.dua,
        id: 5,
        isFeatured: false,
        name: 'Kebijakan Publik',
        desc: 'Hukum Tata Ruang dan Perencanaan Kota, Perizinan dan Regulasi, Penegakan Hukum Publik',
        imageName: 'kebijakan_publik',
      ),
      Product(
        category: Category.dua,
        id: 6,
        isFeatured: false,
        name: 'Teknologi dan Media',
        desc: 'Perlindungan Data dan Privasi, Kepemilikan Intelektual, Sengketa Teknologi dan Media',
        imageName: 'teknologi_media',
      ),
      Product(
        category: Category.dua,
        id: 7,
        isFeatured: true,
        name: 'Keuangan dan Perbankan',
        desc: 'Transaksi Keuangan, Penyelesaian Sengketa Perbankan, Kepatuhan Regulasi Keuangan',
        imageName: 'keuangan_perbankan',
      ),
      Product(
        category: Category.dua,
        id: 8,
        isFeatured: true,
        name: 'Properti',
        desc: 'Pembelian, Penjualan, dan Sewa Properti, Penyelesaian Sengketa Properti, Izin dan Perizinan Properti',
        imageName: 'properti',
      ),
      Product(
        category: Category.dua,
        id: 9,
        isFeatured: true,
        name: 'Internasional',
        desc: 'Bisnis Internasional, Hubungan Diplomatik, Hukum Perdamaian dan Konflik Bersenjata',
        imageName: 'internasional',
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}