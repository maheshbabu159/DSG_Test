//
//  LoadingIndicator.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import Foundation
import UIKit

public class LoadingOverlay{

    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var bgView = UIView()

    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }

    public func showOverlay(view: UIView) {
        DispatchQueue.main.async {
            self.bgView.frame = view.frame
            self.bgView.backgroundColor = UIColor.systemGray6
            self.bgView.addSubview(self.overlayView)
            self.bgView.autoresizingMask = [.flexibleLeftMargin,.flexibleTopMargin,.flexibleRightMargin,.flexibleBottomMargin,.flexibleHeight, .flexibleWidth]
            self.overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            self.overlayView.center = view.center
            self.overlayView.autoresizingMask = [.flexibleLeftMargin,.flexibleTopMargin,.flexibleRightMargin,.flexibleBottomMargin]
            self.overlayView.backgroundColor = UIColor.black
            self.overlayView.clipsToBounds = true
            self.overlayView.layer.cornerRadius = 10

            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            self.activityIndicator.style = UIActivityIndicatorView.Style.large
            self.activityIndicator.color = .white
            self.activityIndicator.center = CGPoint(x: self.overlayView.bounds.width / 2, y: self.overlayView.bounds.height / 2)

            self.overlayView.addSubview(self.activityIndicator)
            view.addSubview(self.bgView)
            self.activityIndicator.startAnimating()
        }
    }

    public func hideOverlayView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.bgView.removeFromSuperview()
        }
    }
}
