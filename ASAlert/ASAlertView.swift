//
//  ASAlertView.swift
//  ASAlert
//
//  Created by Aravind on 21/02/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

/*  Samople alert view like OSX */

import UIKit

public class ASAlertView: UIView {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    var nibName: String = "ASAlertView"
    var contentView: UIView!
    var timer: Timer?
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    public convenience init(image: UIImage, title: String, message : String) {
        self.init()
        setUpView()
        self.imgView.image = image
        self.lblTitle.text = title
        self.lblMessage.text = message
    }
    
    func setUpView()
    {
        self.contentView = UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil)[0] as! UIView
        addSubview(contentView)
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        lblTitle.text = ""
        lblMessage.text = ""
    }
    
    open override func layoutSubviews() {
        // Rounded corners
        self.layoutIfNeeded()
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 10
    }
    
    public func set(image: UIImage) {
        self.imgView.image = image
    }
    public func set(title text: String) {
        self.lblTitle.text = text
    }
    public func set(message text: String) {
        self.lblMessage.text = text
    }
    
    open override func didMoveToSuperview() {
        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        }) { _ in
            self.timer = Timer.scheduledTimer(
                timeInterval: TimeInterval(3.0),
                target: self,
                selector: #selector(self.removeSelf),
                userInfo: nil,
                repeats: false)
        }
    }
    
    @objc private func removeSelf() {
        // Animate removal of view
        UIView.animate(
            withDuration: 0.15,
            animations: {
                self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.contentView.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
}
