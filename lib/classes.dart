class Club {
  String name;
  String country;
  int tropheis;

  Club({required this.name, required this.country, required this.tropheis});

  // String get info ()=>

  String info() {
    return '$name is a club based in $country and it has $tropheis tropheis ';
  }

  void printInfo() {
    print(info());
  }
}

void main() {
  Club club1 = Club(name: 'Liv', country: 'England', tropheis: 20);
  Club club2 = Club(name: 'Real madrid', country: 'Spain', tropheis: 60);
  Club club3 = Club(name: 'FCB', country: 'Spain', tropheis: 5);

  club2.tropheis = 50;
  // club3.info();

  club3.printInfo();
}
