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
