import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Center(
              child: Text(
                'Proyecto Periférico',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          // 🔹 DATOS GENERALES DEL PROYECTO
          _buildSectionHeader('DATOS GENERALES DEL PROYECTO'),
          _buildDrawerItem(context, 'Introducción', '/introduccion'),
          _buildDrawerItem(context, 'Antecedentes', '/antecedentes'),
          _buildDrawerItem(context, 'Planos', '/planos'),
          _buildDrawerItem(context, 'PERTH', '/perth'),
          _buildDrawerItem(context, 'Costos', '/costos'),

          // 🔹 CALENTAMIENTO GLOBAL
          _buildSectionHeader('CALENTAMIENTO GLOBAL'),
          _buildDrawerItem(context, 'Próximamente...', '/'),

          // 🔹 FINANCIERO
          _buildSectionHeader('FINANCIERO'),
          _buildDrawerItem(context, 'Análisis financiero', '/financiero'),

          // 🔹 MATERIA
          _buildSectionHeader('MATERIA'),
          ExpansionTile(
            title: const Text('Estructuras', style: TextStyle(fontWeight: FontWeight.w600)),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              _buildDrawerItem(context, 'Cálculo de zapatas', '/calculo_zapatas'),
              _buildDrawerItem(context, 'Cálculo de columnas', '/calculo_columnas'),
            ],
          ),
          ExpansionTile(
            title: const Text('Pavimentos', style: TextStyle(fontWeight: FontWeight.w600)),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              _buildDrawerItem(context, 'Cálculo de ejes equivalentes', '/calculos'),
            ],
          ),
          ExpansionTile(
            title: const Text('Caminos', style: TextStyle(fontWeight: FontWeight.w600)),
            childrenPadding: const EdgeInsets.only(left: 16),
            children: [
              _buildDrawerItem(context, 'Cálculo de curvas', '/curvas'),
            ],
          ),

          // 🔹 AJUSTES
          _buildSectionHeader('AJUSTES'),
          _buildDrawerItem(context, 'Modo Oscuro (próximamente)', '/'),

          // 🔹 IMPLEMENTACIONES
          _buildSectionHeader('IMPLEMENTACIONES'),
          _buildDrawerItem(context, 'Estadísticas', '/estadisticas'),
          _buildDrawerItem(context, 'Historial', '/historial'),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/portada'));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}