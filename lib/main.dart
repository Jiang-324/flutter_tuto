import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text(appTitle)),
        body:
        // const SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       ImageSection(image: 'images/lake.png'),
        //       TitleSection(
        //         name: 'Oeschinen Lake Campground',
        //         location: 'Kandersteg, Switzerland',
        //       ),
        //       ButtonSection(),
        //       TextSection(
        //         description:
        //         'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
        //         'Bernese Alps. Situated 1,578 meters above sea level, it '
        //         'is one of the larger Alpine Lakes. A gondola ride from '
        //         'Kandersteg, followed by a half-hour walk through pastures '
        //         'and pine forest, leads you to the lake, which warms to 20 '
        //         'degrees Celsius in the summer. Activities enjoyed here '
        //         'include rowing, and riding the summer toboggan run.',
        //       ),
        //     ],
        //   ),
        // )
        Center(child: TapboxB(
          onChanged: (bool active){
            print('asdf');
          },
        )),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          const FavoriteWidget(),
        ],
      )
    );
    throw UnimplementedError();
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Color color = Theme
        .of(context)
        .primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
    throw UnimplementedError();
  }
}

class TextSection extends StatelessWidget {
  const TextSection ({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
    throw UnimplementedError();
  }

}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label
  });
  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
    throw UnimplementedError();
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
    throw UnimplementedError();
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteWidgetState();

}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited ? const Icon(Icons.star) : const Icon(Icons.star_border)),
            onPressed: _toggleFavorite,
            color: Colors.red,
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$_favoriteCount'))),

      ],
    );
    throw UnimplementedError();
  }

  void _toggleFavorite() {
    setState(() {
      if(_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

class TapboxA extends StatefulWidget {
  const TapboxA({super.key});

  @override
  State<StatefulWidget> createState() => _TapboxState();
}

class _TapboxState extends State<TapboxA>{
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: TapboxC(active: _active, onChanged: _handleTapboxChanged),
    );
    throw UnimplementedError();
  }
}

class TapboxC extends StatefulWidget {
  const TapboxC({super.key, this.active = false, required this.onChanged});
  
  final bool active;
  final ValueChanged<bool> onChanged;
  
  @override
  State<StatefulWidget> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(color: Colors.teal[700]!, width: 10)
              : null,
        ),
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class TapboxB extends StatelessWidget {
  const TapboxB({super.key, this.active = false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
