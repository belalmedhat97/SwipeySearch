//
//  SwipeySearchClass.swift
//  SwipeySearch
//
//  Created by belal medhat on 03/08/2022.
//

import UIKit

@IBDesignable public class SwipeySearchClass: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak public var searchView: UIView!
    
    @IBOutlet weak public var searchButton: UIButton!
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            contentView.layer.cornerRadius = cornerRadius
            contentView.layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            contentView.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            contentView.layer.borderColor = borderColor?.cgColor
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initMe()
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initMe()
        
    }
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initMe()
        
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
        initMe()
    }
    
    private func initMe(){
        
        let bundle = Bundle(for: SwipeySearchClass.self)
        let view = UINib(nibName: "SwipeySearchView", bundle: bundle).instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(view)
        
        
    }
    public func buttonShape(type:SearchShape) {
        searchButton.clipsToBounds = true
        
        switch type {
        case .circle:
            searchButton.layer.cornerRadius = searchButton.frame.width/2
            break
        case .roundedSquare(let corner):
            searchButton.layer.cornerRadius = corner
            break
        }
        
        
    }
}

public enum SearchShape {
    case circle
    case roundedSquare(corner:CGFloat)
}

