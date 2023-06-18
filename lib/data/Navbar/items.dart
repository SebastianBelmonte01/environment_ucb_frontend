import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:flutter/material.dart';

class NavItems {
  final List<BottomNavItem> bottomNavItemsProfessor = [
    BottomNavItem(
        icon: Icons.access_time, label: 'Pendiente', route: '/pendingScreen'),
    BottomNavItem(
        icon: Icons.check_box, label: 'Aceptado', route: '/aprovedScreen'),
    BottomNavItem(
        icon: Icons.clear_rounded,
        label: 'Rechazado',
        route: '/rejectedScreen'),
    BottomNavItem(
        icon: Icons.safety_check_sharp,
        label: 'Terminado',
        route: '/finishedScreen'),
  ];
  final List<BottomNavItem> bottomNavItemsAdmin = [
    BottomNavItem(
        icon: Icons.access_time,
        label: 'Pendiente',
        route: '/pendingAdminScreen'),
    BottomNavItem(
        icon: Icons.arrow_drop_down_circle_outlined,
        label: 'Reclamos',
        route: '/claimedAdminScreen'),
  ];
}
