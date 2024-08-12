# Kata: Flutter Animations - Composed Animations

In this kata we will make use of the knowledge we hopefully gathered from the previous exercise to combine several basic animation approaches to create real world examples which you might see in production apps out there. This should ideally show you how (relatively) simple we can create cool animations to enhance the user experience of our apps.

## bouncy_chips

![Bouncy Chips](./bouncy_chip_solution.gif)

This challenge will teach you how to build a custom implicit animation, using a StatefulWidget and an AnimationController. You will also use one controller to drive multiple animations with different behaviour.

We want to animate a chip so that the "checkmark" bounces when we select the chip and the "checkmark" scales up when we deselect the chip. The chip should also change its color when selected.

Requirements:

Unselected to selected state transition:

- The checkmark should appear and become a bit bigger than the final state (bounce) and then settle for the final size - the height of the chip must not be changed.
- The width of the chip should animate and also bounce to be a bit bigger than necessary.

In `bouncy_chip.dart` you will find a skeleton with TODO comments to go through.

Suggested steps:

1. Create A `Tween` and use the `_controller` to animate it. Store the animation in `_animation`.
2. Use the `_animation` to animate the checkmark. Make use of the "Transition" widgets - you can find more about them here: https://docs.flutter.dev/ui/widgets/animation
3. To "rerender" the widget you can either use `setState` or an `AnimatedBuilder`.
4. Split the `_animation` into two animations: one for scaling and one for the size.
5. Try using different Curves or TweenSequences to make the animation more interesting.
6. Skip the animation when the widget is built the first time. Check `initState`.
7. Bonus: Animate the color and border width as well.

Tips:
We added a time dilation factor to slow down the animation. You can remove it if you want to see the animation at normal speed. The time dilation is part of the core framework and you could even use it in a production app ;)

## animated_stack

https://github.com/user-attachments/assets/d94df9a4-3adf-401c-b075-bb46a594a6dd

This challenge is probably a known one and you might have seen it in different flavours for several use cases: stack components on top of each other and let them spread in order to see them all. Let us see how challenging it is to implement something like this with only making use of implicit animations! :)

Feel free to add your own touch regarding which curve(s) to use and the overall speed of the animation - it is supposed to be a baseline example which can be implemented in many ways. Try to only make use of implicit animations though to show how far you can get by only making use of those!

Requirements:

stack to unstacked:

- When stacked, we want to see that they are indeed stacked which means they need some kind of offset and need to be a little bit smaller in size when behind each other
- When unstacked, we want to be able to see them all as a list underneath each other
- This transition and their properties need to be animated properly

In `animated_stack.dart` you will find a skeleton with TODO comments to go through.

Suggested steps:

1. Check the overall structure of the widget tree (build method)
2. Since this challenge is all about implicit animations, check out all the available widgets flutter has: https://docs.flutter.dev/ui/widgets/animation (Tip: the implicit ones are all starting with `Animated*`)
3. Most of the used widgets in the example have matching `Animated*` versions, check out what's possible with them
4. Come up with a logic which makes use of the `_expanded` property to trigger the implicit animations
5. For this challenge, feel free to use hard coded values for size, offset etc. - making this generic would take quite some time and additional brain power :-D
