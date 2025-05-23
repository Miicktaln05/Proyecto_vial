import 'package:flutter/material.dart';

// Pantallas principales
import 'pages/portada.dart';
import 'pages/menu.dart';
import 'pages/introduccion.dart';
import 'pages/antecedentes.dart';
import 'pages/planos.dart';
import 'pages/perth.dart';

// Subpantallas de antecedentes
import 'pages/introduccion_antecedentes.dart';
import 'pages/contexto_general.dart';
import 'pages/justificacion.dart';
import 'pages/estudios_preliminares.dart';
import 'pages/situacion_actual.dart';
import 'pages/planes_politicas.dart';
import 'pages/antecedentes_tecnicos.dart';
import 'pages/propuesta_lugar.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/portada': (context) => const PortadaPage(),
  '/menu': (context) => const MenuPage(),
  '/introduccion': (context) => const IntroduccionPage(),
  '/antecedentes': (context) => const AntecedentesPage(),
  '/planos': (context) => const PlanosPage(),
  '/perth': (context) => const PerthPage(),

  // Subrutas de antecedentes
  '/introduccion-antecedentes': (context) => const IntroduccionAntecedentesPage(),
  '/contexto-general': (context) => const ContextoGeneralPage(),
  '/justificacion': (context) => const JustificacionPage(),
  '/estudios-preliminares': (context) => const EstudiosPreliminaresPage(),
  '/situacion-actual': (context) => const SituacionActualPage(),
  '/planes-politicas': (context) => const PlanesPoliticasPage(),
  '/antecedentes-tecnicos': (context) => const AntecedentesTecnicosPage(),
  '/propuesta-lugar': (context) => const PropuestaLugarPage(),
};

