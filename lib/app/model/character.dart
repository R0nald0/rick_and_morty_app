
class Character {
    final  String name;    
    final String  species;
    final String status;
    final String image;
    Character({
    required this.name,
    required this.species,
    required this.status,
    required this.image
  });

  Character copyWith({
    String? name,
    String? species,
    String? status,
    String? image    
  }) {
    return Character(
          name: name ?? this.name,
      species: species ?? this.species,
      status: status ?? this.status,
      image: image ?? this.image
    );
  }
}
