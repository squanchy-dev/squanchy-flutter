class Event {
  final String title;
  final List<Speaker> speakers;
  final String where;
  final String floor;
  final String when;
  final String description;

  const Event({
  this.title,
  this.speakers,
  this.where,
  this.floor,
  this.when,
  this.description,
  });
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
          fullName: "Eugenio Marletti",
          avatarUrl:
          "http://it.droidcon.com/2017/wp-content/uploads/2015/02/3f952ce.jpg"),
      const Speaker(
          fullName: "Sebastiano Poggi",
          avatarUrl:
          "http://it.droidcon.com/2017/wp-content/uploads/2015/02/sebastiano-poggi.jpg"),
    ],
    where: "Sala Londra",
    floor: "Ground floor",
    when: "Thursday, 6 April at 16:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?

Turns out, there is. It’s part of a “native cross-platform” framework, Flutter, that is being developed in Google and used in some of their products. While still a long way from stable and feature-complete, Flutter has an interesting approach of including a full framework based off of Dart. It’s modeled on the good bits of the Android UI framework and will allow your code to run consistently across devices, without the weird BSP- or vendor-specific issues we unfortunately got used to.

This talk is going to give you an overview of that framework, highlight where it differs from the Android one, and give you an idea of where things are at this stage of the Flutter development. Let’s try to understand if Flutter is something to look forward to
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?
""",
    );
