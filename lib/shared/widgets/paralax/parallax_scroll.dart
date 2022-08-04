import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ParallaxScroll extends StatefulWidget {
  const ParallaxScroll({
    Key? key,
    this.children = const <Widget>[],
    this.parallaxBackgroundChildren = const <ParallaxElement>[],
    this.parallaxForegroundChildren = const <ParallaxElement>[],
    this.controller,
    this.physic,
  }) : super(key: key);

  final List<Widget> children;
  final List<ParallaxElement> parallaxBackgroundChildren;
  final List<ParallaxElement> parallaxForegroundChildren;
  final ScrollPhysics? physic;
  final ScrollController? controller;

  @override
  State createState() => _ParallaxScrollState();
}

class _ParallaxScrollState extends State<ParallaxScroll> {
  final _scrollDataSubject = BehaviorSubject<double>();
  final Map<Duration, Stream<double>> _scrollStreams = {};

  @override
  void dispose() {
    _scrollDataSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ..._buildParallaxElements(widget.parallaxBackgroundChildren),
        NotificationListener<ScrollNotification>(
          onNotification: _onScrollUpdate,
          child: SingleChildScrollView(
            controller: widget.controller,
            physics: widget.physic,
            child: Column(
              children: widget.children,
            ),
          ),
        ),
        ..._buildParallaxElements(widget.parallaxForegroundChildren),
      ],
    );
  }

  List<_ParallaxElementWrapper> _buildParallaxElements(
      List<ParallaxElement> elements) {
    List<_ParallaxElementWrapper> result = [];
    for (ParallaxElement element in elements) {
      result.add(
        _ParallaxElementWrapper(element,
            scrollPostitionStream: _getDelayedScrollStream(
              element.scrollDelay,
            )),
      );
    }

    return result;
  }

  bool _onScrollUpdate(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      _scrollDataSubject.add(notification.metrics.pixels);
    }
    return true;
  }

  Stream<double>? _getDelayedScrollStream(Duration duration) {
    if (!_scrollStreams.containsKey(duration)) {
      _generateScrollStream(duration);
    }

    return _scrollStreams[duration];
  }

  void _generateScrollStream(Duration duration) {
    _scrollStreams.putIfAbsent(
        duration, () => _scrollDataSubject.delay(duration));
  }
}

class ParallaxElement extends StatelessWidget {
  const ParallaxElement({
    Key? key,
    this.scrollDelay = const Duration(),
    required this.child,
  }) : super(key: key);

  final Duration scrollDelay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class _ParallaxElementWrapper extends StatelessWidget {
  const _ParallaxElementWrapper(
    this.child, {
    required this.scrollPostitionStream,
    Key? key,
  }) : super(key: key);

  final ParallaxElement child;
  final Stream<double>? scrollPostitionStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: scrollPostitionStream,
      builder: (context, snapshot) {
        return Positioned(
          top: -1 * (snapshot.data ?? 0.0),
          child: child,
        );
      },
    );
  }
}
