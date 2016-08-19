# SlidingViewControllerTransitionDemo

#What is this for?

It's a custom view controller transition in the syle of iOS 6 slide transition rather than the iOS 7 style overlap transition.

#What is it based on?

UIViewControllerAnimatedTransitioning, introduced in iOS 7.

#Which classes do I need to pull out of this project to use it?

Just SlideAnimator.swift. 

#What other code to I need to write to get it working?

In your presenting view controller, implement UINavigationControllerDelegate, set the navigation controller delegate to self, and implement the protocol method animationControllerForOperation. See MyPresentingViewController.swift in the project for the code you need to add.

#How can I customize the transition animation?

Open SlideAnimator.swift. On line 17 you can change the speed. On line 31 you can change it to ease in or out.

#What is UIPresentationController?

That it used for custom modal presentations. This isn't a modal presentation and UIPresentationController is not used here.
