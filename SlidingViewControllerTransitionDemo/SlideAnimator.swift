//
//  SlideAnimator.swift
//
//  Created by Merch on 2016-08-07.
//  Copyright © 2016 MerchV. All rights reserved.
//

import UIKit

class SlideAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var presenting = false

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.containerView()?.addSubview(transitionContext.viewForKey(UITransitionContextToViewKey)!)

        let fromViewInitialFrame = transitionContext.initialFrameForViewController(transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!)
        let fromViewFinalFrame = presenting == true ? fromViewInitialFrame.offsetBy(dx: 0 - fromViewInitialFrame.size.width, dy: 0) : fromViewInitialFrame.offsetBy(dx: fromViewInitialFrame.size.width, dy: 0)

        let toViewFinalFrame = transitionContext.finalFrameForViewController(transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        let toViewInitialFrame = presenting == true ?  toViewFinalFrame.offsetBy(dx: toViewFinalFrame.size.width, dy: 0) : toViewFinalFrame.offsetBy(dx: 0 - toViewFinalFrame.size.width, dy: 0)
        transitionContext.viewForKey(UITransitionContextToViewKey)?.frame = toViewInitialFrame


        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            transitionContext.viewForKey(UITransitionContextFromViewKey)?.frame = fromViewFinalFrame
            transitionContext.viewForKey(UITransitionContextToViewKey)?.frame = toViewFinalFrame
        }) { (done) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }


    }

}
