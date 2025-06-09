import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

// Pantallas principales
import 'pages/portada.dart';
import 'pages/introduccion.dart';
import 'pages/antecedentes.dart';
import 'pages/planos.dart';
import 'pages/perth.dart';
import 'pages/costos.dart';
import 'pages/introduccion_antecedentes.dart';
import 'pages/contexto_general.dart';
import 'pages/justificacion.dart';
import 'pages/estudios_preliminares.dart';
import 'pages/situacion_actual.dart';
import 'pages/planes_politicas.dart';
import 'pages/antecedentes_tecnicos.dart';
import 'pages/propuesta_lugar.dart';
import 'pages/historial_page.dart';
import 'pages/estadisticas_page.dart';
import 'pages/calculos_page.dart';
import 'pages/resultado_page.dart';
import 'pages/procedimiento_page.dart';
import 'pages/financiero_page.dart';

// MATERIA
import 'pages/materia_page.dart';
import 'pages/estructuras_page.dart';
import 'pages/caminos_page.dart';
import 'pages/curvas_page.dart';
import 'pages/calculo_columnas_page.dart';
import 'pages/calculo_zapatas_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/portada': (context) => const PortadaPage(),
  '/introduccion': (context) => const IntroduccionPage(),
  '/antecedentes': (context) => const AntecedentesPage(),
  '/planos': (context) => const PlanosPage(),
  '/perth': (context) => const PerthPage(),
  '/costos': (context) => const CostosPage(),
  '/introduccion-antecedentes': (context) => const IntroduccionAntecedentesPage(),
  '/contexto-general': (context) => const ContextoGeneralPage(),
  '/justificacion': (context) => const JustificacionPage(),
  '/estudios-preliminares': (context) => const EstudiosPreliminaresPage(),
  '/situacion-actual': (context) => const SituacionActualPage(),
  '/planes-politicas': (context) => const PlanesPoliticasPage(),
  '/antecedentes-tecnicos': (context) => const AntecedentesTecnicosPage(),
  '/propuesta-lugar': (context) => const PropuestaLugarPage(),
  '/historial': (context) => const HistorialPage(),
  '/estadisticas': (context) => const EstadisticasPage(),
  '/calculos': (context) => const CalculosPage(),
  '/resultado': (context) => const ResultadoPage(),
  '/procedimiento': (context) => const ProcedimientoPage(),
  '/financiero': (context) => const FinancieroPage(),

  // MATERIA
  '/materia': (context) => const MateriaPage(),
  '/estructuras': (context) => const EstructurasPage(),
  '/caminos': (context) => const CaminosPage(),
  '/curvas': (context) => const CurvasPage(),
  '/calculo_columnas': (context) => const CalculoColumnasPage(),
  '/calculo_zapatas': (context) => const CalculoZapatasPage(),
};