class Space {
  String imageUrl, name, city, country, address, phone, mapUrl;
  int id, rating, price, numOfKitchen, numOfBedrooms, numOfCupboards;
  List photos;

  Space(
      {this.imageUrl,
      this.name,
      this.price,
      this.rating,
      this.city,
      this.country,
      this.id,
      this.address,
      this.mapUrl,
      this.phone,
      this.numOfBedrooms,
      this.numOfCupboards,
      this.numOfKitchen,
      this.photos});

  factory Space.fromjson(Map<String, dynamic> json) {
    return Space(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        price: json["price"],
        imageUrl: json["image_url"],
        rating: json["rating"],
        address: json["address"],
        phone: json["phone"],
        mapUrl: json["map_url"],
        photos: json["photos"],
        numOfKitchen: json["number_of_kitchens"],
        numOfBedrooms: json["number_of_bedrooms"],
        numOfCupboards: json["number_of_cupboards"]);
  }
}
