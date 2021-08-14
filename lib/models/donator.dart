class Donator {
  final String name;
  final String phoneNo;
  final String total;
  final DateTime date;

  Donator({
    required this.name,
    required this.phoneNo,
    required this.total,
    required this.date,
  });
}

List<Donator> donators = [
  Donator(
    name: 'Anonymous',
    phoneNo: '1284-6969-4646',
    total: '50',
    date: DateTime(
      2019,
      8,
      14,
    ),
  ),
  Donator(
    name: 'Anonymous',
    phoneNo: '118-1019-9999',
    total: '70',
    date: DateTime(
      2019,
      8,
      14,
    ),
  ),
  Donator(
    name: 'Stephen Jr',
    phoneNo: '118-7978-3218',
    total: '50',
    date: DateTime(
      2019,
      8,
      14,
    ),
  ),
  Donator(
    name: 'Ruppert McDonald',
    phoneNo: '1284-6969-4646',
    total: '50',
    date: DateTime(
      2019,
      9,
      17,
    ),
  ),
  Donator(
    name: 'Anonymous',
    phoneNo: '1284-6969-4646',
    total: '100',
    date: DateTime(
      2019,
      9,
      17,
    ),
  ),
];

List<DateTime> donatorsDates = filterDonatorsDate();

List<DateTime> filterDonatorsDate() {
  List<DateTime> filteredDates = [];

  for (int i = 0; i < donators.length; i++) {
    if (i + 1 >= donators.length) {
      break;
    }
    if (donators[i].date.millisecondsSinceEpoch ==
        donators[i + 1].date.millisecondsSinceEpoch) {
      continue;
    }

    filteredDates.add(donators[i].date);
    filteredDates.add(donators[i + 1].date);
  }

  return filteredDates;
}

List<Donator> filterDonators(DateTime date) {
  return donators.where((element) => element.date == date).toList();
}
