class User {
  final String name;
  final String job;
  final int age;

  const User({
    required this.name,
    required this.job,
    required this.age
  });

  User copy({
    String? name,
    String? job,
    int? age,
  }) => User(
    name: name ?? this.name,
    job: job ?? this.job,
    age: age ?? this.age
  );
}