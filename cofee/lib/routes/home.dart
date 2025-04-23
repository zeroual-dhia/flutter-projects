import 'package:cofee/models/navigation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../widgets/coffecart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _textController = TextEditingController();
  // ignore: non_constant_identifier_names
  String to_search = "";
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return ChangeNotifierProvider(
        create: (context) =>
            NavigationProvider(), // Provide the Counter instance
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff212325),
            leading: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.sort_rounded,
                color: Colors.grey,
                size: 35,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.notifications,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Left-align content
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "It's a great day for coffee", // Fixed typo
                  style: TextStyle(color: Colors.white, fontSize: 27),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBar(
                  controller: _textController,
                  textStyle: const WidgetStatePropertyAll(
                      TextStyle(color: Colors.white)),
                  hintText: 'Find your coffee', // Fixed typo
                  hintStyle: const WidgetStatePropertyAll(
                      TextStyle(color: Colors.grey, fontSize: 18)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20)),
                  backgroundColor: const WidgetStatePropertyAll(
                      Color.fromARGB(255, 49, 51, 54)),
                  leading: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),

                  onChanged: (query) {
                    setState(() {
                      to_search = query;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Left-aligned TabBar
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  isScrollable: true,
                  controller: _tabController,
                  indicatorColor: const Color(0xffe57734),
                  labelColor: const Color(0xffe57734),
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3, color: Color(0xffe57734)),
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                  labelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  tabs: const [
                    Tab(
                      text: "All",
                    ),
                    Tab(text: "Milk-Based"),
                    Tab(text: "Strong"),
                    Tab(text: "Classic"),
                    Tab(text: "Cold"),
                    Tab(text: "Chocolate-Based"),
                    Tab(text: "Dessert"),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Correct placement of TabBarView inside Expanded
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTabContent("all", to_search),
                    _buildTabContent("Milk-Based", to_search),
                    _buildTabContent("Strong", to_search),
                    _buildTabContent("Classic", to_search),
                    _buildTabContent("Cold", to_search),
                    _buildTabContent("Chocolate-Based", to_search),
                    _buildTabContent("Dessert", to_search),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Consumer<NavigationProvider>(
            builder: (context, navigation, child) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 10,
                selectedItemColor: const Color(0xffe57734),
                unselectedItemColor: Colors.white,
                iconSize: 28,
                backgroundColor: const Color(0xff212325),
                currentIndex: navigation.getIndex,
                onTap: (index) {
                  navigation.ChangePage(index);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: " "),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: " "),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications), label: " "),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: " ")
                ],
              );
            },
          ),
        ));
  }

  Widget _buildTabContent(String coffeeType, String tosearch) {
    return FutureBuilder(
      future: _fetchCoffee(coffeeType),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
              child: Text('Failed to load data',
                  style: TextStyle(color: Colors.white)));
        } else {
          List coffeeList = snapshot.data as List;
          if (tosearch.isNotEmpty) {
            RegExp regexp = RegExp(
              '^$tosearch',
              caseSensitive: false,
            ); // Optional: case insensitive search
            coffeeList = coffeeList
                .where((item) => regexp.hasMatch(item['name']))
                .toList();
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              itemCount: coffeeList.length, // ✅ Dynamically set item count
              itemBuilder: (context, index) {
                return CoffeCart(coffe: coffeeList[index]);
              },
            ),
          );
        }
      },
    );
  }

  Future<List> _fetchCoffee(String coffeeType) async {
    try {
      late final http.Response response;
      if (coffeeType == "all") {
        response = await http.get(Uri.parse('http://192.168.1.6:3000/coffee'));
      } else {
        response = await http
            .get(Uri.parse('http://192.168.1.6:3000/coffee?type=$coffeeType'));
      }

      if (response.statusCode == 200) {
        return json.decode(response.body); // Parses JSON data
      } else {
        throw Exception(
            'Failed to load data - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Failed to load data");
    }
  }
}
