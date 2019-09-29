# Responsive Builder

A Kind of CSS way to define breakpoints in your Flutter layout

## Propose
This project has been built thinking an easy and less verbose possible way to get the breakpoints defined in CSS on Flutter.
With this project you can define sizes, which your app will rebuild the view to get the most responsible layout for current size 

An basic example: 

![Portrait -> Landscape](/preview.png?raw=true "Portrait to landscape")

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

WIP...