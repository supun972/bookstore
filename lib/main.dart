// lib/main.dart
import 'package:flutter/material.dart';
import 'book.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> books = [
      Book(
        title: 'Harry potter',
        author: 'J.K. Rowlin',
        imagePath: 'assets/images/Harry_potter_.jpg',
        price: 19.99,
        description: 'The magical journey of the young wizard Harry Potter.',
      ),
      Book(
        title: 'The_Origin_of_Species',
        author: 'Charles darwin',
        imagePath: 'assets/images/The_Origin_of_Species.webp',
        price: 14.99,
        description: 'outlines the theory of evolution by natural selection, proposing that all living organisms descend from a common ancestor and gradually change over time through adaptations best suited to their environment, leading to the diversity of life on Earth today',
      ),
      Book(
        title: 'To_Kill_a_mockingbird',
        author: 'Harper lee',
        imagePath: 'assets/images/To_Kill_a_mockingbird.webp',
        price: 20.99,
        description: 'tells the story of Scout Finch, a young girl navigating racial prejudice and injustice as her lawyer father, Atticus Finch, defends a Black man wrongly accused of rape, teaching her valuable lessons about morality and empathy through a deeply flawed legal system.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Book Store'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  child: Image.asset(
                    books[index].imagePath,
                    height: 600,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        books[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'by ${books[index].author}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${books[index].price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          TextButton(
                            onPressed: () {

                            },
                            child: const Text('Details'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}