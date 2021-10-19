// {
// "first_name": "Arena",
// "last_name": "Grande",
// "region": "North America",
// "country": "UK",
// "bio": "It is a long established fact that a reader will be distracted by the
// readable content of a page when looking at its layout. The point of using Lorem Ipsum
// is that it has a more-or-less normal distribution of letters,",
// "post": 200,
// "followers": 25000,
// "following": 50,
// "profile_pic":
// "https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?ixid=MnwxMjA3fDB8MHxwaG9
// 0by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3988&q=80"
// }
import 'dart:convert';

class UserProfile {
  UserProfile(
      {this.firstName,
      this.lastName,
      this.region,
      this.country,
      this.bio,
      this.post,
      this.followers,
      this.following,
      this.profilePic});

  String? firstName;
  String? lastName;
  String? region;
  String? country;
  String? bio;
  int? post;
  int? followers;
  int? following;
  String? profilePic;

  factory UserProfile.fromJson(Map<String, dynamic> parsedJson) {
    return UserProfile(
      firstName: parsedJson["first_name"],
      lastName: parsedJson["last_name"],
      region: parsedJson["region"],
      country: parsedJson["country"],
      bio: parsedJson["bio"],
      post: parsedJson["post"],
      followers: parsedJson["followers"],
      following: parsedJson["following"],
      profilePic: parsedJson["profile_pic"],
    );
  }
}
