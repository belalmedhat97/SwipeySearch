//
//  SwipeySearchClass.swift
//  SwipeySearch
//
//  Created by belal medhat on 03/08/2022.
//

import UIKit


// enum for button type
public enum SearchShape {
    case circle
    case roundedSquare(corner:CGFloat)
}

public protocol SwipeySearchProtocol{
    func handleDidPressSearch(textValue:String)
    func handleDidChangeText(textValue:String)
}

@IBDesignable public class SwipeySearchView: UIView {
    

    @IBOutlet  var contentView: UIView!
    @IBOutlet weak  public var searchView: UIView!
    @IBOutlet weak  public var searchButton: UIButton!
    
    
    
    @IBAction func searchBtn(_ sender: UIButton) {
        openSearch()
    }
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        dismissSearch()
    }
    
    // for redrawing programmatic views
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        // used when drawing the
        addSearchBar()
        buttonConfig()
        

    }
    // for coding initalization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initMe()
        
        
    }
    // for storyboard initalization

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initMe()
        
        
    }
    
    
    
    // check type of button and field
    private var isBtnAndFieldCircle:Bool = false
    //
    
    // define the searchField and it's constraints
    var SearchField:UITextField = UITextField()
    private var leftTextOpen:NSLayoutConstraint!
    private var RightTextOpen:NSLayoutConstraint!
    private var WidthTextClose:NSLayoutConstraint!
    private var RightTextClose:NSLayoutConstraint!
    //
    // delegate for Swipey protocols
    public var delegate:SwipeySearchProtocol?
    //


    // search Field + button border & color
    @IBInspectable public  var borderWidth: CGFloat = 0 {
        didSet {
            SearchField.layer.borderWidth = borderWidth
            searchButton.layer.borderWidth = borderWidth

        }
    }
    @IBInspectable public  var borderColor: UIColor? {
        didSet {
            SearchField.layer.borderColor = borderColor?.cgColor
            searchButton.layer.borderColor = borderColor?.cgColor

        }
    }

    
    // MARK: -   search Field + button shadows
    @IBInspectable  public var shadowOpacity: Float = 0.3 {
        didSet {
            searchButton.layer.shadowOpacity = shadowOpacity
            SearchField.layer.shadowOpacity = shadowOpacity

            
        }
    }
    @IBInspectable  public var shadowOffset: CGSize = CGSize(width: -1, height: 1) {
        didSet {
            searchButton.layer.shadowOffset = shadowOffset
            SearchField.layer.shadowOffset = shadowOffset

        }
    }
    @IBInspectable  public var shadowRadius: CGFloat = 5 {
        didSet {
            searchButton.layer.shadowRadius = shadowRadius
            SearchField.layer.shadowRadius = shadowRadius

        }
    }
    @IBInspectable  public var shadowColor: UIColor? = #colorLiteral(red: 0.6509803922, green: 0.737254902, blue: 0.8156862745, alpha: 1)  {
        didSet {
            searchButton.layer.shadowColor = shadowColor?.cgColor
            SearchField.layer.shadowColor = shadowColor?.cgColor
        }
    }
    //
    
    // MARK: - search button color + icon color
    
    @IBInspectable public  var buttonColor: UIColor? = .lightGray{
        didSet {
            searchButton.backgroundColor = buttonColor
        }
    }
        @IBInspectable public  var buttonIconColor: UIColor? {
            didSet {
                searchButton.setImage(searchButton.currentImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
                searchButton.tintColor = buttonIconColor
                
            }
        }
    @IBInspectable public  var buttonIcon: UIImage? {
        didSet {
            searchButton.setImage(buttonIcon, for: .normal)
        }
    }
    
    @IBInspectable public  var isButtonCircle: Bool = true{
        didSet {
            if isButtonCircle == true {
                isBtnAndFieldCircle = true
                searchButtonShape(type: .circle)
                SearchField.layer.cornerRadius = 20
            }else{
                isBtnAndFieldCircle = false
                searchButtonShape(type: .roundedSquare(corner: buttonCorner))
            }
        }
    }
    @IBInspectable public  var buttonCorner: CGFloat = 5 {
        didSet {
            if !isBtnAndFieldCircle {
                searchButtonShape(type: .roundedSquare(corner: buttonCorner))
                SearchField.layer.cornerRadius = buttonCorner
                
            }
        }
    }
    // MARK: - search field font and colors
    @IBInspectable public var searchFieldBgColor:UIColor = .white {
        didSet{
            SearchField.backgroundColor = searchFieldBgColor
        }
    }
    @IBInspectable public var searchFieldFontColor:UIColor = .gray {
        didSet{
            SearchField.textColor = searchFieldBgColor
        }
    }
    @IBInspectable public var searchFieldfontName: String = "" {
        didSet {
            SearchField.font = UIFont.init(name: searchFieldfontName, size: searchFieldfontSize)
        }
    }

    @IBInspectable public var searchFieldfontSize: CGFloat = 12 {
        didSet {
            SearchField.font = UIFont.init(name: searchFieldfontName, size: searchFieldfontSize)
        }
    }
    @IBInspectable public var fieldPlaceHolderTxt: String = "Search" {
        didSet {
            SearchField.placeholder = fieldPlaceHolderTxt
        }
    }
    @IBInspectable public var fieldPlaceHolderColor: UIColor = .gray {
        didSet {
            SearchField.attributedPlaceholder = NSAttributedString(
                string: fieldPlaceHolderTxt,
                attributes: [NSAttributedString.Key.foregroundColor: fieldPlaceHolderColor])
            
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
     


    


}


// MARK: - draw functions for SearchField View
extension SwipeySearchView {
    
    private func initMe(){
        let bundle = Bundle(for: SwipeySearchView.self)
        let view = UINib(nibName: "SwipeySearchView", bundle: bundle).instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        addSubview(view)
        }
    
    
    private func addSearchBar(){
        SearchField = UITextField(frame: CGRect(x: searchButton.frame.minX, y: searchButton.frame.minY, width: searchButton.frame.width, height: searchButton.frame.height))
        SearchField.layer.cornerRadius = buttonCorner
        SearchField.layer.masksToBounds = false
        SearchField.backgroundColor = searchFieldBgColor
        // shadow for searchfield
        SearchField.layer.shadowOffset = shadowOffset
        SearchField.layer.shadowRadius = shadowRadius
        SearchField.layer.shadowOpacity = shadowOpacity
        SearchField.layer.shadowColor = shadowColor?.cgColor
        
        SearchField.textColor = searchFieldFontColor
        searchView.insertSubview(SearchField, belowSubview: searchButton)
        // set placeholder text place
        SearchField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.searchButton.frame.height))
        SearchField.leftViewMode = UITextField.ViewMode.always
        SearchField.alpha = 0
        SearchField.placeholder = fieldPlaceHolderTxt
        SearchField.attributedPlaceholder = NSAttributedString(
            string: fieldPlaceHolderTxt,
            attributes: [NSAttributedString.Key.foregroundColor: fieldPlaceHolderColor])
        SearchField.font = UIFont.init(name: searchFieldfontName, size: searchFieldfontSize)

        
        SearchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    private func buttonConfig(){
        searchButton.layer.masksToBounds = false
        searchButton.layer.shadowOffset = shadowOffset
        searchButton.layer.shadowRadius = shadowRadius
        searchButton.layer.shadowOpacity = shadowOpacity
        searchButton.layer.shadowColor = shadowColor?.cgColor
        searchButton.layer.cornerRadius = buttonCorner
    }
    private func openSearch(){
        if searchButton.tag == 0 {
            SearchField.translatesAutoresizingMaskIntoConstraints = false
            searchButton.translatesAutoresizingMaskIntoConstraints = true
            if RightTextClose != nil {
                RightTextClose.isActive = false
                WidthTextClose.isActive = false
            }
            RightTextOpen = self.SearchField.rightAnchor.constraint(equalTo: self.searchButton.leftAnchor, constant: -10 )
            leftTextOpen = self.SearchField.leftAnchor.constraint(equalTo: self.searchView.leftAnchor, constant: 10)
            RightTextOpen.isActive = true
            leftTextOpen.isActive = true
            self.SearchField.heightAnchor.constraint(equalTo: self.searchButton.heightAnchor, constant: 0).isActive = true
            self.SearchField.centerYAnchor.constraint(equalTo: self.searchView.centerYAnchor).isActive = true

            UIView.animate(withDuration: 1.2) {
                self.contentView.layoutIfNeeded()
                self.SearchField.alpha = 1
                self.SearchField.placeholder = self.fieldPlaceHolderTxt
            }
            searchButton.tag = 1
        }else{
            // when press search with text on it 
            self.delegate?.handleDidPressSearch(textValue: SearchField.text ?? "")
        }
    }
    
    private func dismissSearch(){
        if searchButton.tag == 1 {
            RightTextOpen.isActive = false
            leftTextOpen.isActive = false
            
            RightTextClose = self.SearchField.rightAnchor.constraint(equalTo: self.searchButton.rightAnchor, constant: 0)
            WidthTextClose = self.SearchField.widthAnchor.constraint(equalTo: self.searchButton.widthAnchor, constant: 0)
            
            RightTextClose.isActive = true
            WidthTextClose.isActive = true
            
            
            UIView.animate(withDuration: 1.2) {
                self.contentView.layoutIfNeeded()

            }
            searchButton.tag = 0
        }
    }
    // for switch circle or round button
    public func searchButtonShape(type:SearchShape) {
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
    // for text change in searchfield
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.delegate?.handleDidChangeText(textValue: textField.text ?? "")
    }
}
