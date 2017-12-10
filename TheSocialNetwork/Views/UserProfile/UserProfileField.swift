//
//  UserProfileField.swift
//  TheSocialNetwork
//
//  Created by Atul Bipin on 2017-12-10.
//  Copyright © 2017 Pr0At1t. All rights reserved.
//

import UIKit

@IBDesignable
class UserProfileField: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var fieldValue: UILabel!

    @IBInspectable
    var fieldLabelText: String? {
        didSet {
            self.fieldLabel.text = self.fieldLabelText
        }
    }

    public var value: String? {
        didSet {
            self.fieldValue.text = self.value
        }
    }

    override init(frame: CGRect) {
        fatalError("UserProfileField not supposed to be initialized in code")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNibView()
    }

    private func setupNibView() {
        Bundle.main.loadNibNamed("UserProfileField", owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
