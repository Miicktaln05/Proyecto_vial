// 📄 lib/widgets/side_menu.dart
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key, required this.onItemSelected});
  final Function(String) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),

          ExpansionTile(
            title: const Text('Datos Generales del Proyecto'),
            children: [
              _buildTile('Introducción'),
              _buildTile('Antecedentes'),
              _buildTile('Planos'),
              _buildTile('PERT'),
              _buildTile('Costos'),
            ],
          ),
          _buildTile('Innovación', isSimple: true),
          _buildTile('Calentamiento Global', isSimple: true),
          _buildTile('Financiero', isSimple: true),

          ExpansionTile(
            title: const Text('Materia'),
            children: [
              ExpansionTile(
                title: const Text('Estructuras'),
                children: [_buildTile('Cálculo columnas y zapatas')],
              ),
              ExpansionTile(
                title: const Text('Pavimentos'),
                children: [_buildTile('Cálculo ejes equivalentes')],
              ),
              ExpansionTile(
                title: const Text('Caminos'),
                children: [_buildTile('Cálculo de curvas')],
              ),
            ],
          ),

          _buildTile('Ajustes', isSimple: true),
          _buildTile('Implementaciones', isSimple: true),
        ],
      ),
    );
  }

  Widget _buildTile(String label, {bool isSimple = false}) {
    return ListTile(
      title: Text(label),
      onTap: () => onItemSelected(label),
      dense: isSimple,
    );
  }
}
