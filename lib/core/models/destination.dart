class Destination {
  final String id;
  final String name;
  final String country;
  final String description;
  final String imageUrl;
  final double rating;
  final List<String> activities;
  final bool isFavorite;

  const Destination({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.activities,
    this.isFavorite = false,
  });

  Destination copyWith({
    String? id,
    String? name,
    String? country,
    String? description,
    String? imageUrl,
    double? rating,
    List<String>? activities,
    bool? isFavorite,
  }) {
    return Destination(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      activities: activities ?? this.activities,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  // Sample destinations data
  static List<Destination> sampleDestinations = [
    const Destination(
      id: '6',
      name: 'Paris',
      country: 'France',
      description: 'Paris, France\'s capital, is a major European city and a global center for art, fashion, gastronomy, and culture.',
      imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      rating: 4.5,
      activities: ['Eiffel Tower Visit', 'Museum Tour', 'Café Hopping', 'Seine River Cruise'],
    ),
    const Destination(
      id: '1',
      name: 'Bali',
      country: 'Indonesia',
      description: 'Bali is a living postcard, an Indonesian paradise that feels like a fantasy. Soak up the sun on a stretch of fine white sand, or commune with the tropical creatures as you dive along coral ridges or the colorful wreck of a WWII war ship.',
      imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      rating: 4.8,
      activities: ['Beach', 'Surfing', 'Temple Visit', 'Hiking'],
    ),
    const Destination(
      id: '2',
      name: 'Santorini',
      country: 'Greece',
      description: 'Santorini is one of the Cyclades islands in the Aegean Sea. It was devastated by a volcanic eruption in the 16th century BC, forever shaping its rugged landscape. The whitewashed, cubiform houses of its 2 principal towns, Fira and Oia, cling to cliffs above an underwater caldera.',
      imageUrl: 'https://images.unsplash.com/photo-1570077188670-6a96fe40e681?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      rating: 4.7,
      activities: ['Wine Tasting', 'Boat Tour', 'Sunset Viewing', 'Beach'],
    ),
    const Destination(
      id: '3',
      name: 'Kyoto',
      country: 'Japan',
      description: 'Kyoto, once the capital of Japan, is a city on the island of Honshu. It\'s famous for its numerous classical Buddhist temples, as well as gardens, imperial palaces, Shinto shrines and traditional wooden houses.',
      imageUrl: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      rating: 4.9,
      activities: ['Temple Visit', 'Cherry Blossom Viewing', 'Tea Ceremony', 'Historic District'],
    ),
    const Destination(
      id: '4',
      name: 'Machu Picchu',
      country: 'Peru',
      description: 'Machu Picchu is an Incan citadel set high in the Andes Mountains in Peru, above the Urubamba River valley. Built in the 15th century and later abandoned, it is renowned for its sophisticated dry-stone walls that fuse huge blocks without the use of mortar.',
      imageUrl: 'https://images.unsplash.com/photo-1526392060635-9d6019884377?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      rating: 4.9,
      activities: ['Hiking', 'Photography', 'Archaeological Tour', 'Mountain Views'],
    ),
    const Destination(
      id: '5',
      name: 'New York City',
      country: 'United States',
      description: 'New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that is among the world"s major commercial, financial and cultural centers.',
      imageUrl: 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      rating: 4.6,
      activities: ['Shopping', 'Museums', 'Broadway Shows', 'Central Park'],
    ),
  ];
}
