class CountryStatesModel {
  String countryName;
  List<String> banks;

  List<String> statesList;
  CountryStatesModel(
      {required this.banks,
      required this.countryName,
      required this.statesList});
}

List<CountryStatesModel> countriesInfo = [
  CountryStatesModel(
      countryName: "Nepal",
      banks: ['bank1', 'bank2', 'bank3', 'bank4'],
      statesList: ['Kathmandu', 'Lalitpur', 'Bhakptapur', 'pokhara']),
  CountryStatesModel(countryName: 'Singapore', banks: [
    'bank1',
    'bank2',
    'bank3',
    'bank4'
  ], statesList: [
    'Pulau Seletar',
    'Simpang North',
    'Simpang South',
    'Tanjong Irau'
  ]),
  CountryStatesModel(
      countryName: 'Malaysia',
      banks: ['bank1', 'bank2', 'bank3', 'bank4'],
      statesList: ['Johor', 'Kedah', 'Kelantan', 'Malacca', 'pahang'])
];
