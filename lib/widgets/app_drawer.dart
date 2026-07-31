import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, bottom: 90),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BackButtonWidget(
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                //   imagePath: 'assets/cross.png',
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset('assets/images/login.png'),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(100.0),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(14.0),
                  //     child: storage.user != null && storage.user!.userImg != ""
                  //         ? CircleAvatar(
                  //       radius: 30,
                  //       backgroundImage:
                  //       NetworkImage(storage.user!.userImg),
                  //     )
                  //         : const CircleAvatar(
                  //       radius: 30,
                  //       backgroundImage:
                  //       AssetImage('assets/profilePlaceholder.png'),
                  //     ),
                  //   ),
                  // ),
                ),
                // Text(
                //   storage.user!.username,
                //   style: twentyEight700TextStyle(),
                // ),
                // Text(
                //   storage.user!.email,
                //   style: twenty400TextStyle(color: lightGreyColor),
                // ),
                const SizedBox(height: 50),
              ],
            ),
            //DrawerHeader
            ListTile(
              leading: Image.asset(
                'assets/images/login.png',
                height: 20,
                width: 20,
              ),
              title: Text(
                ' News Feed ',
                // style: twenty700TextStyle(),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, homeScreenRoute);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/login.png',
                height: 20,
                width: 20,
              ),
              title: Text(
                'Account Setting ',
                // style: twenty700TextStyle(),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, accountSettingScreenRoute);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/login.png',
                height: 20,
                width: 20,
              ),
              title: Text(
                ' Delete Account ',
                // style: twenty700TextStyle(),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, deleteScreenRoute);
              },
            ),
            ListTile(
              leading: const Icon(Icons.policy, size: 25, color: Colors.black),
              title: Text(
                'Privacy Policy ',
                // style: twenty700TextStyle(),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, privacyPolicyScreenRoute);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/login.png',
                height: 20,
                width: 20,
              ),
              title: Text(
                'Logout ',
                // style: twenty700TextStyle(),
              ),
              onTap: () {
                Navigator.pop(context);
                // userRepository.signOut(context);
                //
                // Navigator.pushNamedAndRemoveUntil(
                //     context, loginScreenRoute, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
