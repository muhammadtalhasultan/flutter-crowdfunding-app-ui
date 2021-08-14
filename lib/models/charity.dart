class Charity {
  final String name;
  final String assetName;

  Charity({required this.name, required this.assetName});
}

List<Charity> charities = [
  Charity(
    name: 'Education',
    assetName: 'assets/images/grad.png',
  ),
  Charity(
    name: 'Health',
    assetName: 'assets/images/medic.png',
  ),
  Charity(
    name: 'Environment',
    assetName: 'assets/images/env.png',
  ),
  Charity(
    name: 'Animal',
    assetName: 'assets/images/animal.png',
  ),
  Charity(
    name: 'Culture & Arts',
    assetName: 'assets/images/event.png',
  ),
];
