class Player {
  final String name;
  final String sport;
  final String country;

  Player({
    required this.name,
    required this.sport,
    required this.country,
  });
}

final List<Player> allPlayers = [
  Player(name: 'Lionel Messi', sport: 'Soccer', country: 'Argentina'),
  Player(name: 'Serena Williams', sport: 'Tennis', country: 'United States'),
  Player(name: 'LeBron James', sport: 'Basketball', country: 'United States'),
  Player(name: 'Usain Bolt', sport: 'Track', country: 'Jamaica'),
  Player(name: 'Simone Biles', sport: 'Gymnastics', country: 'United States'),
  Player(name: 'Roger Federer', sport: 'Tennis', country: 'Switzerland'),
];
