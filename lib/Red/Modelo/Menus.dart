import 'package:flutter/material.dart';

class IconoMenu {
  final IconData icono;
  final String ruta;
  final String Nbre;
  final String Nbre2;

  IconoMenu(
      {required this.icono,
      required this.Nbre,
      required this.ruta,
      required this.Nbre2});
}

List<IconoMenu> iconos = [
  IconoMenu(
      icono: Icons.person_add_alt_outlined,
      Nbre: "Ingreso Paciente",
      ruta: '/Ingreso',
      Nbre2: 'Ingreso'),
  IconoMenu(
      icono: Icons.assignment,
      Nbre: "Historia Clinica",
      ruta: '/HistoriaClinica',
      Nbre2: 'Tratamientos Paciente'),
  IconoMenu(
      icono: Icons.spa,
      Nbre: "Terapias",
      ruta: '/Terapias',
      Nbre2: 'Rehabilitaciones'),
  IconoMenu(
      icono: Icons.local_hospital_outlined,
      Nbre: "Enfermeria",
      ruta: '/Enfermeria',
      Nbre2: 'Actividades y cuidados'),
  IconoMenu(
      icono: Icons.receipt_long,
      Nbre: "Facturacion",
      ruta: '/Facturación',
      Nbre2: 'Pagos, facturas y Servicios'),
  IconoMenu(
      icono: Icons.account_balance_wallet,
      Nbre: "Cartera",
      ruta: '/Cartera',
      Nbre2: 'Cuentas por Cobrar y Pagos'),
  IconoMenu(
      icono: Icons.calculate,
      Nbre: "Contabilidad",
      ruta: '/Contabilidad',
      Nbre2: 'Ingresa Aqui'),
  IconoMenu(
      icono: Icons.group,
      Nbre: "Talento Humano",
      ruta: '/Talento Humano',
      Nbre2: 'Gestión del personal'),
  IconoMenu(
      icono: Icons.calendar_today,
      Nbre: "Cita",
      ruta: '/Cita',
      Nbre2: 'Programación de citas'),
  IconoMenu(
      icono: Icons.folder,
      Nbre: "Archivo",
      ruta: '/Archivo',
      Nbre2: 'Almacenamiento'),
  IconoMenu(
      icono: Icons.science,
      Nbre: "Laboratorio",
      ruta: '/Laboratorio',
      Nbre2: 'Gestión de Pruebas'),
  IconoMenu(
      icono: Icons.health_and_safety,
      Nbre: "SST",
      ruta: '/SST',
      Nbre2: 'Prevención de Riesgos '),
  IconoMenu(
      icono: Icons.priority_high,
      Nbre: "Triage",
      ruta: '/Triage',
      Nbre2: 'Clasificación y Priorización'),
  IconoMenu(
      icono: Icons.local_hospital,
      Nbre: "Referencia",
      ruta: '/Refrencia',
      Nbre2: 'Ingresa Aqui'),
  IconoMenu(
      icono: Icons.verified,
      Nbre: "Calidad",
      ruta: '/Calidad',
      Nbre2: 'Control y Aseguramiento'),
  IconoMenu(
      icono: Icons.fact_check,
      Nbre: "Auditoria",
      ruta: '/Auditoría',
      Nbre2: 'Revisión y Evaluación'),
  IconoMenu(
      icono: Icons.local_pharmacy,
      Nbre: "Farmacia",
      ruta: '/Compras',
      Nbre2: 'Medicinas y Suministros'),
  IconoMenu(
      icono: Icons.settings,
      Nbre: "Configuracion",
      ruta: '/Configuracion',
      Nbre2: 'Personaliza Aplicación'),
  IconoMenu(
      icono: Icons.account_circle,
      Nbre: "Perfil",
      ruta: '/Perfil',
      Nbre2: 'Información Personal'),
];
