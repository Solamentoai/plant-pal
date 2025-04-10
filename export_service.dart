import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

class ExportService {
  Future<void> exportData(List<Map<String, dynamic>> data) async {
    String csvData = const ListToCsvConverter().convert(data);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/plant_data.csv');
    await file.writeAsString(csvData);
    print('Data exported to ${file.path}');
  }
}
