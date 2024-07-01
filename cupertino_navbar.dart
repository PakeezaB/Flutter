import 'package:flutter/cupertino.dart';

class SliverNavBarExample extends StatelessWidget {
  const SliverNavBarExample({super.key});
//An iOS-styled navigation bar with iOS-11-style large titles using slivers.

//The CupertinoSliverNavigationBar must be placed in a sliver group such as the CustomScrollView.

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            leading: Icon(CupertinoIcons.person_2),
            largeTitle: Text('Contacts'),
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text('Drag me up', textAlign: TextAlign.center),
                CupertinoButton.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute<Widget>(
                        builder: (BuildContext context) {
                          return const NextPage();
                        },
                      ),
                    );
                  },
                  child: const Text('Go to Next Page'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemYellow,
        border: Border(
          bottom: BorderSide(
            color: brightness == Brightness.light
                ? CupertinoColors.black
                : CupertinoColors.white,
          ),
        ),
        middle: const Text('Contacts Group'),
        // largeTitle: const Text('Family'),
      ),
      child: const CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Drag me up', textAlign: TextAlign.center),
                Text('Tap on the leading button to navigate back',
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
