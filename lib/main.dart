import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final int indexNumber = 211265;

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Маичка',
      'image': 'https://magnetik.mk/images/thumbs/0518776_paulshark-bluzi_900.jpeg',
      'description': 'Удобна памучна маичка за секојдневна употреба.',
      'price': 1000.0,
    },
    {
      'name': 'Панталони',
      'image': 'https://extrem.mk/wp-content/uploads/2021/01/SOFTSHELL-PANTALONI-MASHKI-ZIMNI-AKRON-1-1.jpg',
      'description': 'Модерни панталони со висок квалитет.',
      'price': 2500.0,
    },
    {
      'name': 'Јакна',
      'image': 'https://www.dsport.mk/media/opti_image/webp/catalog/product/cache/d25c7ffaa33cd077a5eb0dc50e0fb1f1/T/9/T940212-9849_1.webp',
      'description': 'Топла зимска јакна за студени денови.',
      'price': 5000.0,
    },
    {
      'name': 'Патики',
      'image': 'https://www.sportvision.mk/files/thumbs/files/images/slike_proizvoda/media/FJ7/FJ7792-400/images/thumbs_350/FJ7792-400_350_350px.jpg',
      'description' : 'Удобни патики за трчање',
      'price' : 12000.0,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Индекс: $indexNumber'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(image: NetworkImage(product['image']),
                      fit: BoxFit.cover,
                  )
                ),
              ),
              title: Text(product['name']),
              subtitle: Text('${product['price']} денари'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage(product['image']),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              'Цена: ${product['price']} денари',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
