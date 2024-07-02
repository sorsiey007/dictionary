import 'package:flutter/material.dart';
import 'definition_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> items = List.generate(
    100,
    (index) => {
      "word": "Word $index",
      "definition": "This is the definition of word $index.",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        leading: IconButton(
          onPressed: () {
            // Define what happens when the icon is pressed
          },
          icon: const Icon(Icons.abc, size: 28, color: Colors.white),
        ),
        title: const Text(
          "Agricultural Dictionary",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Define what happens when the icon is pressed
            },
            icon:
                const Icon(Icons.apps_outlined, size: 28, color: Colors.white),
          ),
          const SizedBox(width: 8), // Add space between the icons
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Material(
              elevation: 5.0,
              shadowColor: Colors.black45,
              borderRadius: BorderRadius.circular(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: () {
                      // Define what happens when the microphone icon is pressed
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: Icon(Icons.eco, color: Colors.teal[700]),
                title: Text(
                  item["word"]!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                trailing:
                    Icon(Icons.turned_in_not_rounded, color: Colors.teal[700]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DefinitionScreen(
                        word: item["word"]!,
                        definition: item["definition"]!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Audio Words',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[700],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
