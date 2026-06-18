import 'package:flutter/material.dart';
import 'package:lol/EXERCISE-2/model/profile_tile_model.dart';

import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  final ProfileData profile;
  const ProfileApp({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      // Approch 1 
//       body: ListView(
//           children: [
//             const SizedBox(height: 40),
//             const CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage(
//                   'assets/images/w8/aang.png'), 
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Ronan OGOR',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.primary,
//               ),
//             ),
//             const Text(
//               'Flutter Developer',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 20),
//             ...profile.tiles.map((tile) => ProfileTile(
//               icon: tile.icon,
//               title: tile.title,
//               data: tile.value,
// )),
//           ],
//         ),
        // Approach 2 
        body: Column(
        children: [
          const SizedBox(height: 40),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(profile.avatarUrl),
          ),
          const SizedBox(height: 20),
          Text(
            profile.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Text(
            profile.position,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: profile.tiles.length,
              itemBuilder: (context, index) {
                final tile = profile.tiles[index];
                return ProfileTile(
                  icon: tile.icon,
                  title: tile.title,
                  data: tile.value,
                );
              },
            ),
          ),
        ],
      ),

      );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
