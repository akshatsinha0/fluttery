import 'package:flutter/material.dart';
import '../../../core/models/destination.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/destination_card.dart';
import '../../../features/details/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _categories = [
    'All', 'Popular', 'Beach', 'Mountain', 'Historic'
  ];
  final List<Destination> _destinations = Destination.sampleDestinations;
  late List<Destination> _filteredDestinations;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
    _filteredDestinations = _destinations;
    
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _filterDestinations(_categories[_tabController.index]);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterDestinations(String category) {
    setState(() {
      if (category == 'All') {
        _filteredDestinations = _destinations;
      } else {
        _filteredDestinations = _destinations.where((destination) {
          if (category == 'Popular') {
            return destination.rating > 4.7;
          }
          return destination.activities.any((activity) => 
            activity.toLowerCase().contains(category.toLowerCase()));
        }).toList();
      }
    });
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDestinations = _destinations;
      } else {
        _filteredDestinations = _destinations.where((destination) {
          final name = destination.name.toLowerCase();
          final country = destination.country.toLowerCase();
          final searchQuery = query.toLowerCase();
          return name.contains(searchQuery) || country.contains(searchQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom App Bar with Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _isSearching
                  ? _buildSearchField()
                  : CustomAppBar(
                      title: 'Explore',
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              _isSearching = true;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                            // Navigate to favorites
                          },
                        ),
                      ],
                    ),
            ),
            
            // Welcome message
            if (!_isSearching) ...[
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0, 
                  right: 16.0, 
                  top: 8.0,
                  bottom: 16.0
                ),
                child: Text(
                  'Discover amazing places',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
            
            // Category tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: _categories.map((category) => 
                  Tab(text: category)
                ).toList(),
              ),
            ),
            
            // Destinations grid
            Expanded(
              child: _filteredDestinations.isEmpty
                  ? const Center(
                      child: Text('No destinations found'),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      gridDelegate: 
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: _filteredDestinations.length,
                      itemBuilder: (context, index) {
                        final destination = _filteredDestinations[index];
                        return DestinationCard(
                          destination: destination,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => 
                                    DetailsScreen(destination: destination),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search destinations...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _searchController.clear();
            _handleSearch('');
            setState(() {
              _isSearching = false;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.light 
            ? Colors.grey.shade200 
            : Colors.grey.shade800,
      ),
      onChanged: _handleSearch,
    );
  }
}
// Import the DetailsScreen to avoid errors
// import '../../../features/details/screens/details_screen.dart';
