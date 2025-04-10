import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../services/firestore_service.dart';

class UpdatePlantScreen extends StatefulWidget {
  final Plant plant;

  UpdatePlantScreen({required this.plant});

  @override
  _UpdatePlantScreenState createState() => _UpdatePlantScreenState();
}

class _UpdatePlantScreenState extends State<UpdatePlantScreen> {
  late TextEditingController _nameController;
  late int _wateringFrequency;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.plant.name);
    _wateringFrequency = widget.plant.wateringFrequency;
  }

  void _updatePlant() {
    FirestoreService().updatePlant(widget.plant.id, _nameController.text, _wateringFrequency);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Plant')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Plant Name')),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Water every $_wateringFrequency days'),
                Slider(
                  value: _wateringFrequency.toDouble(),
                  min: 1,
                  max: 14,
                  divisions: 13,
                  label: '$_wateringFrequency',
                  onChanged: (val) {
                    setState(() {
                      _wateringFrequency = val.toInt();
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _updatePlant,
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
