import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_loading.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/claim_cubit/claim_cubit.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/data/Navbar/items.dart';
import 'package:environment_ucb/dto/claim_dto.dart';
import 'package:environment_ucb/screens/information_claim_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

bool flag = true;

class MyClaimedReservationScreen extends StatefulWidget {
  MyClaimedReservationScreen({Key? key}) : super(key: key);

  @override
  State<MyClaimedReservationScreen> createState() => _MyClaimedReservationScreenState();
}

class _MyClaimedReservationScreenState extends State<MyClaimedReservationScreen> {
  @override
  Widget build(BuildContext context) {


    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final List<BottomNavItem> _bottomNavItems =
        NavItems().bottomNavItemsProfessor;
    return Scaffold(
      appBar: MyAppBar(
        text: "Mis Reclamos",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: BlocBuilder<ClaimCubit, ClaimState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.claimList.length,
            itemBuilder: (BuildContext context, int index) {
              ClaimDto claim = state.claimList[index];
              return MyReservationCard(
                environment: claim.reservationDto?.environment as String,
                subject: claim.reservationDto!.subject.toString(),
                parallel: claim.reservationDto!.parallel.toString(),
                date: dateFormat.format(DateTime.parse(
                    claim.reservationDto!.reservationDate.toString())),
                time: claim.reservationDto?.reservationTimeInit as String,
                bottunText: "Ver detalle",
                bottunColor: state.isAnswered!
                    ? AppTheme.primary
                    : AppTheme.alert,
                borderColor: state.isAnswered!
                    ? AppTheme.primary
                    : AppTheme.alert,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyInformationClaimScreen(),
                      //INFORMATION FINSHED
                      //
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: GFToggle(
        onChanged: (value) {
          setState(
            () {
              flag = value!;
            },
          );
          if (value!) {
            BlocProvider.of<ClaimCubit>(context).getAnsweredClaimsUser();
            BlocProvider.of<ClaimCubit>(context).changeToogle(true);

          } else {
            BlocProvider.of<ClaimCubit>(context).getPendingClaimsUser();
            BlocProvider.of<ClaimCubit>(context).changeToogle(false);
            
          }
        },
        value: flag,
        type: GFToggleType.ios,
      ),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 4),
    );
  }
}


class MyClaimScreen extends StatelessWidget {
  const MyClaimScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<BottomNavItem> navItems = NavItems().bottomNavItemsProfessor;
    BlocProvider.of<ClaimCubit>(context).getAnsweredClaimsUser();
    
    return BlocBuilder<ClaimCubit, ClaimState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Container(
            child: state.status == PageStatus.loading
                ? myLoadingPage(
                    text: "Mis Reclamos \n Respondidos", index: 4, bottomNavItems: navItems)
                : state.status == PageStatus.success
                    ? MyClaimedReservationScreen()
                    : const Text("Error"),
          );
        });
  }
}

