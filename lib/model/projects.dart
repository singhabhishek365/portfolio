class Projects {
  String? image;
  String? projectName;
  String? projectDescription;

  Projects({
    this.image,
    this.projectDescription,
    this.projectName
  });
}


List<Projects> projectList = [
  Projects(
      image: "assets/png/pexels-elly-fairytale-3823207 1.png",
      projectName: "Editors's App",
      projectDescription:
          "I created this personal project in order to show how to create an interface in Figma using a portfolio as an example."),
  Projects(
      image: "assets/png/Rectangle 7 (1).png",
      projectName: "Portfolio App",
      projectDescription:
          "I created this personal project in order to show how to create an interface in Figma using a portfolio as an example."),
  Projects(
      image: "assets/png/Rectangle 7.png",
      projectName: "Matrimonial App",
      projectDescription:
          "I created this personal project in order to show how to create an interface in Figma using a portfolio as an example."),
];
