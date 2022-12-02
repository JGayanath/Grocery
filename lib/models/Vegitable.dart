class Vegitable {
  Vegitable({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.dsc =
        "Grapes  is a long established fact that a reader\nwill be distracted by the readable content of a\npage when looking at its layout. The point of\nusing Lorem Ipsum is that it has a more-or-less\nnormal distribution.",
  });
  late final int id;
  late final String name;
  late final double price;
  late final String image;
  final String dsc;
}
