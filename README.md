# Responsive Builder

A Kind of CSS way to define breakpoints in your Flutter layout

## Propose
This project has been built thinking an easy and less verbose possible way to get the breakpoints defined in CSS on Flutter.
With this project you can define sizes, which your app will rebuild the view to get the most responsible layout for current size 

**basic example** 

![Portrait -> Landscape](/example-preview.png?raw=true "Portrait to landscape")

## Why
Design responsive layouts it shouldn't be hard! Specially for who come from web, which there is easiest way: defining CSS breakpoints.
Flutter provide to us an Widget which rebuild when we have changes on layout size, btw, It was a little painful, to create internal if on render view, its look dirty, I think this is to much responsible too one file and is not reusable.
Because of it, I created this package, one where you can:

- Different looks according with current size of screen
- Reuse your breakpoints
- Don't dirty your views with conditional size logic

## Getting Started

Since this project it wasn't published on Pub (yet!), you should use in your project by adding the dependency on pubspec.yml referring the Github package

```yaml
dependencies:
  # ...
  responsive_builder:
    git: https://github.com/hjJunior/responsive-builder.dart
```

## How to use
1. Import the package where you'll need to rebuild your widget according with breakpoint
2. (Optional) Use children prop to reuse the common Widget that exists between the layouts
3. Define the list of breakpoints
4. Define **in same order** the responsible builder for each breakpoint defined before

```dart
import 'package:responsive_builder/responsive_builder.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      children: <Widget>[
        Text('Text 1'),
        Text('Text 2'),
        Text('Text 3'),
      ],
      breakpoints: [
        ResponsiveBreakpoint.byPortraitMode(), // index: 0
        ResponsiveBreakpoint.byLandscapeMode(), // index: 1
      ],
      builders: [
        (context, children) => Column(children: children,), // index 0: portrait
        (context, children) => Row(children: children,), // // index 1: landscape
      ],
    );
  }
}
```

## Breakpoints
Currently, these are the constructors available to make your layout responsible

| Method | Description |
|--|--|
| `ResponsiveBreakpoint.byPortraitMode();` | Rebuild when device is on portrait mode |
| `ResponsiveBreakpoint.byLandscapeMode();` | Rebuild when device is on landscape mode |
| `ResponsiveBreakpoint.byMinHeight();` | Rebuild when screen have the minimum height specified | 
| `ResponsiveBreakpoint.byMinWidth();` | Rebuild when screen have the minimum width specified |
| `ResponsiveBreakpoint.byMaxHeight();` | Rebuild when screen have the maximum height specified | 
| `ResponsiveBreakpoint.byManWidth();` | Rebuild when screen have the maximum width specified |

Or use `ResponsiveBreakpoint()` to combine when need an specific combination.
