//
//  MyPresentingViewController.swift
//  SlidingViewControllerTransitionDemo
//
//  Created by Merch on 2016-08-18.
//  Copyright © 2016 MerchV. All rights reserved.
//

import UIKit

class MyPresentingViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }


    // MARK: - UINavigationControllerDelegate

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let slideAnimator = SlideAnimator()
        slideAnimator.presenting = operation == .Push ? true : false
        return slideAnimator
    }

}
