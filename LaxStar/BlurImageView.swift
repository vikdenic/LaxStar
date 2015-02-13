//
//  BlurImageView.swift
//  LaxStar
//
//  Created by Vik Denic on 2/12/15.
//  Copyright (c) 2015 Nektar Labs. All rights reserved.
//

import UIKit

class BlurImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    override init() {
//        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
//        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
//        super.init(coder: aDecoder)
//        effectView.frame = frame
//        addSubview(effectView)
//    }

    required init(coder aDecoder: NSCoder) {
        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        super.init(coder: aDecoder)
        effectView.frame = bounds
        addSubview(effectView)
    }
}