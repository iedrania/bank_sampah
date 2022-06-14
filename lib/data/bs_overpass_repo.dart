import 'package:http/http.dart' as http;
import 'package:bank_sampah/data/bs_overpass_data.dart';

Future<BsOverpassData> fetchElements(String uri) async {
  final response = await http.get(Uri.parse(uri));
  if (response.statusCode == 200) {
    return bsOverpassDataFromJson(response.body);
  } else {
    throw Exception('Failed to load elements');
  }
}