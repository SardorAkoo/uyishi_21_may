import 'package:flutter/material.dart';
import 'package:uyishi_21_may/cpicok.dart';
import 'package:uyishi_21_may/galarey.dart';

class plitka_dasr extends StatefulWidget {
  @override
  _plitka_dasrState createState() => _plitka_dasrState();
}

class _plitka_dasrState extends State<plitka_dasr> {
  final List<Map<String, dynamic>> items = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUF1E2-wTV5Onkx07EiWq9dGx-IG-B3KJ4uA&s",
      "title": "Mac Pro 13 2017",
      "price": 507960,
      "description": "B/Y",
      "city": "Toshkent, Chilonzor rayon",
      "time": '12 may 2024 yil'
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5PG3anBJWXulACR9dc91Y15m0Di2NmIcEDQ&s",
      "title": "Apple MacbookProAirzarydaka",
      "price": 299000,
      "description": "Noviy",
      "city": "Toshkent, Chilonzor rayon",
      "time": 'Bugun 15:13'
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYPZbdrmHML2qcJMy1IS31wB5bKoi2Xqw0rA&s",
      "title": "MacBook Pro 2015",
      "price": 4999000,
      "description": "B/Y",
      "city": "Toshkent, Chilonzor rayon",
      "time": 'Bugun 12:34'
    },
    // Qo'shimcha elementlar qo'shishingiz mumkin
  ];

  List<bool> isDone = List.generate(10, (_) => false);
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OLX UZ'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                PopupMenuButton(
                    icon: Image.network(
                      'https://cdn-icons-png.flaticon.com/128/9354/9354787.png',
                      width: 25,
                    ),
                    style: ButtonStyle(),
                    offset: Offset(0, 50),
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                              child: const Text('Galareya'),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return MyHomePage();
                                    },
                                  ),
                                );
                              }),
                          PopupMenuItem(
                            child: const Text('Royxat'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) {
                                    return CpicokPage();
                                  },
                                ),
                              );
                            },
                          ),
                          PopupMenuItem(
                            child: const Text('Plitka'),
                          )
                        ]),
                Image.network(
                  'https://cdn-icons-png.flaticon.com/128/151/151917.png',
                  width: 25,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Qidiruv',
              ),
              strutStyle: StrutStyle(fontSize: 10),
              cursorColor: Colors.amber,
              cursorErrorColor: Colors.red,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: items.length * 3, // Takrorlash uchun sonini oshirish
              itemBuilder: (context, index) {
                final item = items[index % items.length];
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 15,
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      item["image"]!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                      ),
                                      color: Colors.greenAccent),
                                  child: Text('TOP'),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item["title"]!,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    isDone[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        isDone[index] = !isDone[index];
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    item["description"]!,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "${item['price']} so'm",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item['city']!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
