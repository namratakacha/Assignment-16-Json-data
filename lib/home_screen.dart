import 'package:assignment_16/model/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    loadUserProfile();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  UserProfile? userProfile;

  Future<String> _loadUserProfileAsset() async {
    return await rootBundle.loadString('assets/user_profile.json');
  }

  Future loadUserProfile() async {
    String jsonString = await _loadUserProfileAsset();
    final jsonResponse = json.decode(jsonString);

    setState(() {
      userProfile = UserProfile.fromJson(jsonResponse);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${userProfile?.profilePic}',
                //height: 600,
                // width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${userProfile?.firstName}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  Text('${userProfile?.lastName}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('${userProfile?.region}'),
                                  const SizedBox(width: 10),
                                  const Text(','),
                                  Text('${userProfile?.country}'),
                                ],
                              ),
                            ],
                          )),
                      //Padding(padding: EdgeInsets.all(20)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(padding: EdgeInsets.all(8)),
                          FloatingActionButton(
                            backgroundColor: Colors.amber,
                            elevation: 0,
                            onPressed: () {},
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Column(
                    children: [
                      Text(
                        '${userProfile?.bio}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              const Text('posts'),
                              Text(
                                '${userProfile?.post}',
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              const Text('followers'),
                              Text(
                                '${userProfile?.followers}',
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              const Text('following'),
                              Text(
                                '${userProfile?.following}',
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
