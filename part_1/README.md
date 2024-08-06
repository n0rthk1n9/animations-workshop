# Kata: Flutter Animations - Implicit and Explicit

The goal of this kata is to dive deep into Flutter animations, understanding the difference between implicit and explicit animations, and maybe already leveraging packages for advanced effects.

Animations play a vital role in improving user experience by providing visual feedback and enhancing the interactivity of apps. Whether you're creating a sliding carousel, button bounce effect, or more complex choreographed animations, Flutter has the tools to assist.

## Implicit Animations

These animations are pre-packaged in Flutter and are easier to implement, as Flutter handles most of the animation logistics.

### AnimatedContainer

1. Add an [AnimatedContainer](https://www.youtube.com/watch?v=yI-8QHpGIP4) that changes its color and size when tapped.
2. Set the duration to 300 milliseconds.
3. Choose a nice [curve](https://api.flutter.dev/flutter/animation/Curves-class.html) for the animation.

### AnimatedOpacity

4. Wrap the `AnimatedContainer` with an [AnimatedOpacity](https://www.youtube.com/watch?v=QZAvjqOqiLY).
5. Check if the box's callback is still executed when the opacity is 0.
6. Wrap it with an [IgnorePointer](https://www.youtube.com/watch?v=qV9pqHWxYgI) to fix this.

## Explicit Animations

Explicit animations give more control but require more setup. The main protagonist here is the `AnimationController`.

### Bounce Effect with AnimationController

Animate the button to bounce down and up when tapped.

7. Initialize an `AnimationController` with `vsync` (`this` that is available due to `SingleTickerProviderStateMixin`) and duration.
8. Add a listener to the controller to set the state and refresh the UI.
9. Use the controller's value to change the button's position.
10. When the button is tapped, start the animation.
11. Set `AnimationController.upperBound` for changing the animation's maximum. You can also do this with Tweens (see below).

**Tip: After changing code inside `initState`, make sure to hot restart the app.**

### Bounce Effect with AnimationController and Tween

With Tweens we can animate between two Objects which have a way to 'lerp' (linearly interpolate) between them.

12. Use a [Tween](https://api.flutter.dev/flutter/animation/Tween-class.html) to animate the button or add a Widget of your choice and animate its (size/position/rotation).
13. We can chain Tweens to add a curve to the animation using [CurveTween](https://api.flutter.dev/flutter/animation/CurveTween-class.html) take a look at what is available [here](https://github.com/flutter/flutter/blob/3.13.9/packages/flutter/lib/src/animation/tween.dart)

### TweenSequence

14. Use a [TweenSequence](https://api.flutter.dev/flutter/animation/TweenSequence-class.html) to split the animation into multiple parts. e.g. rotate the Button when it is bouncing, but only during the "peak", or change the color of the button when it is bouncing down.

## Advanced Animations with Packages

15. Add [flutter_animate](https://pub.dev/packages/flutter_animate) to the app:

```bash
flutter pub add flutter_animate
```

16. Add more UI elements (for example `FlutterLogo`) and try to create delightful animations (for example `.animate().scale()`), or simply animate as much as you can.
