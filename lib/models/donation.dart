class Donation {
  final String organizer;
  final String desc;
  final String total;
  final DateTime date;

  Donation({
    required this.organizer,
    required this.desc,
    required this.total,
    required this.date,
  });
}

List<Donation> donations = [
  Donation(
    organizer: 'Side Hat Organization',
    desc: 'Finding Help to Take Their Next Steps',
    total: '100',
    date: DateTime(
      2019,
      8,
      14,
    ),
  ),
  Donation(
    organizer: 'UNICEF',
    desc: 'Realisze Syrian children dreams for school',
    total: '710',
    date: DateTime(
      2019,
      8,
      14,
    ),
  ),
  Donation(
    organizer: 'WHO',
    desc: 'Be part of covid-19 vaccine research development',
    total: '1000',
    date: DateTime(
      2019,
      8,
      14,
    ),
  ),
  Donation(
    organizer: 'Ha He Foundation',
    desc: 'Finding Help to Take Their Next Steps',
    total: '100',
    date: DateTime(
      2019,
      11,
      27,
    ),
  ),
  Donation(
    organizer: 'UNICEF',
    desc: 'Realisze Syrian children dreams for school',
    total: '710',
    date: DateTime(
      2019,
      11,
      27,
    ),
  ),
];

List<DateTime> dates = filterDate();

List<DateTime> filterDate() {
  List<DateTime> filteredDates = [];

  for (int i = 0; i < donations.length; i++) {
    if (i + 1 >= donations.length) {
      break;
    }
    if (donations[i].date.millisecondsSinceEpoch ==
        donations[i + 1].date.millisecondsSinceEpoch) {
      continue;
    }

    filteredDates.add(donations[i].date);
    filteredDates.add(donations[i + 1].date);
  }

  return filteredDates;
}

List<Donation> filterDonation(DateTime date) {
  return donations.where((element) => element.date == date).toList();
}
