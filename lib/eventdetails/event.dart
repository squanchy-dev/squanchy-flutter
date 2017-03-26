class Event {
  final String title;
  final List<Speaker> speakers;
  final String where;
  final String when;
  final String description;

  const Event(
      {this.title, this.speakers, this.where, this.when, this.description});
}

class Speaker {
  final String fullName;
  final String avatarUrl;

  const Speaker({this.fullName, this.avatarUrl});
}

const kEvent = const Event(
    title: "A New Hope",
    speakers: const <Speaker>[
      const Speaker(
          fullName: "Sebastiano Poggi",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/sebastiano-poggi.jpg"),
      const Speaker(
          fullName: "Eugenio Marletti",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/3f952ce.jpg"),
    ],
    where: "Sala Londra",
    when: "Later on",
    description: "Blah blah blah");
