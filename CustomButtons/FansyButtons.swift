//
//  FansyButtons.swift
//  CustomButtons
//
//  Created by Adnann Muratovic on 18.09.21.
//

import UIKit

@IBDesignable
class FansyButtons: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidht: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidht
        }
    }
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    // MARK: - Button Padding
    @IBInspectable var titleLeftPadding: CGFloat = 0.0 {
        didSet {
            titleEdgeInsets.left = titleLeftPadding
        }
    }
    
    @IBInspectable var titleRightPadding: CGFloat = 0.0 {
        didSet {
            titleEdgeInsets.right = titleRightPadding
        }
    }
    
    @IBInspectable var titleTopPadding: CGFloat = 0.0 {
        didSet {
            titleEdgeInsets.top = titleTopPadding
        }
    }
    
    @IBInspectable var titleBottomPadding: CGFloat = 0.0 {
        didSet {
            titleEdgeInsets.bottom = titleBottomPadding
        }
    }
    
    // MARK: - Image Padding
    @IBInspectable var imageLeftPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.left = self.bounds.width - (imageView?.bounds.width)! - imageRightPadding
        }
    }
    
    @IBInspectable var imageTopPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.top = imageTopPadding
        }
    }
    
    @IBInspectable var imageRightPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.right = imageRightPadding
        }
    }
    
    @IBInspectable var imageBottomPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.bottom = imageBottomPadding
        }
    }
    
    // MARK: image Left or Right Side
    @IBInspectable var enableImageRightAligned: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if enableImageRightAligned, let imageView = imageView {
            imageEdgeInsets.left = self.bounds.width - imageView.bounds.width - imageRightPadding
        }
        
        // Gradiant Color
        if enableColorGradiant {
            let gradiantLayer = CAGradientLayer()
            gradiantLayer.frame = self.bounds
            gradiantLayer.colors = [colorGradiant1.cgColor, colorGradiant2.cgColor]
            
            gradiantLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradiantLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            
            self.layer.insertSublayer(gradiantLayer, at: 0)
        }
    }
    
    // MARK: - Color Gradiant
    
    @IBInspectable var enableColorGradiant: Bool = false
    @IBInspectable var colorGradiant1: UIColor = .black
    @IBInspectable var colorGradiant2: UIColor = .white
    
    
}
