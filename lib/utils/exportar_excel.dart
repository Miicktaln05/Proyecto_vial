import 'dart:io';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class ExportadorExcel {
  static Future<void> guardarExcelFinancieroCompleto({
    required double ingresos,
    required double costos,
    required double interes,
    required double utilidad,
    required double vna,
    required double tir,
    required double vac,
    required double cae,
    required double vf,
  }) async {
    final excel = Excel.createExcel();
    final Sheet sheet = excel['Análisis Financiero'];

    final String fecha = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    // 🔷 Encabezado
    sheet.appendRow([
      TextCellValue('📊 Análisis Financiero - Proyecto Periférico')
    ]);
    sheet.appendRow([]);
    sheet.appendRow([
       TextCellValue('Fecha de generación:'), 
      TextCellValue(fecha)
    ]);
    sheet.appendRow([]);

    // 🔢 Datos ingresados
    sheet.appendRow([TextCellValue('🔢 Entradas')]);
    sheet.appendRow([
       TextCellValue('📥 Semanas esperadas'),
      TextCellValue(ingresos.toStringAsFixed(2))
    ]);
    sheet.appendRow([
       TextCellValue('📤 Costos totales (\$)'),
      TextCellValue(costos.toStringAsFixed(2))
    ]);
    sheet.appendRow([
       TextCellValue('📈 Tasa de interés estimada (%)'),
      TextCellValue(interes.toStringAsFixed(2))
    ]);
    sheet.appendRow([
       TextCellValue('💵 Utilidad estimada (\$)'),
      TextCellValue(utilidad.toStringAsFixed(2))
    ]);
    sheet.appendRow([]);

    // 📈 Resultados calculados
    sheet.appendRow([ TextCellValue('📈 Resultados')]);
    sheet.appendRow([
     TextCellValue('✅ Valor Neto Actual (VNA)'),
      TextCellValue(vna.toStringAsFixed(2))
    ]);
    sheet.appendRow([
     TextCellValue('💹 Tasa Interna de Retorno (TIR)'),
      TextCellValue('${tir.toStringAsFixed(2)}%')
    ]);
    sheet.appendRow([
     TextCellValue('📈 VAC (Variación al Finalizar)'),
      TextCellValue(vac.toStringAsFixed(2))
    ]);
    sheet.appendRow([
     TextCellValue('📊 CAE (Costo Anual Equivalente)'),
      TextCellValue(cae.toStringAsFixed(2))
    ]);
    sheet.appendRow([
     TextCellValue('💰 Valor Futuro (VF)'),
      TextCellValue(vf.toStringAsFixed(2))
    ]);
    sheet.appendRow([]);

    // 🧮 Procedimiento técnico
    sheet.appendRow([ TextCellValue('🧮 Procedimiento utilizado')]);
    sheet.appendRow([
      TextCellValue(
        'VNA = ∑(Flujo de efectivo / (1 + tasa de descuento)^periodo) - Inversión inicial'
      )
    ]);
    sheet.appendRow([
       TextCellValue(
        'TIR = Inversión Inicial + ∑ (Flujo de efectivo en el período t / (1 + TIR)^t)'
      )
    ]);
    sheet.appendRow([
      TextCellValue(
        'VAC = BAC - EAC (Presupuesto al Finalizar - Estimación al Finalizar)'
      )
    ]);
    sheet.appendRow([
       TextCellValue(
        'CAE = [(Costo Total Crédito - Monto Crédito) / Monto Crédito] × [(1 + Tasa)^Años]'
      )
    ]);
    sheet.appendRow([
      TextCellValue('VF = VP × (1 + r)^n')
    ]);

    // 📁 Guardar el archivo
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/analisis_financiero.xlsx');
    final bytes = excel.encode();
    await file.writeAsBytes(bytes!);

    // 📂 Abrirlo automáticamente
    await OpenFilex.open(file.path);
  }
}