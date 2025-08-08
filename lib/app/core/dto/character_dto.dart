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