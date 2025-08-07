 class CharacterResponse {
  final  Info info ;
  final  List<CharacterDto> characters  ;

  CharacterResponse({required this.characters, required this.info});
}

class Info{
    final int count;
    final String next;
    final int pages;
    final String  prev;
    
    Info({
    required this.count,
    required this.next,
    required this.pages,
    required this.prev
  });

  factory Info.fromMap(Map<String,dynamic> map){
     return switch(map){{
        'count' : final int count,
        'next' : final String next,
        'pages' : final int pages,
        'prev' : final String prev 
     }
       => Info(count: count, next: next, pages: pages, prev: prev),
       _ => throw ArgumentError('Invalid json')
     };
  }
} 
  class CharacterDto{
    final  String name;    
    final String  species;
    final String status;
    final String image;

  CharacterDto({ required this.name,required this.species,required this.status,required this.image});

  factory CharacterDto.fromMap(Map<String,dynamic> map){
    return switch (map) {{
         'name' : final String name,
       'species' : final String specie,
       'status' : final String status,
       'image' : final String image, 
       }
        => CharacterDto(name: name, species: specie, status: status, image:image ),
     _  => throw ArgumentError('Invalid json')
    } ;
    
  }
 }    