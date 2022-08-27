# SwipeySearch

[![CI Status](https://img.shields.io/travis/belalmedhat97/SwipeySearch.svg?style=flat)](https://travis-ci.org/belalmedhat97/SwipeySearch)
[![Version](https://img.shields.io/cocoapods/v/SwipeySearch.svg?style=flat)](https://cocoapods.org/pods/SwipeySearch)
[![License](https://img.shields.io/cocoapods/l/SwipeySearch.svg?style=flat)](https://cocoapods.org/pods/SwipeySearch)
[![Platform](https://img.shields.io/cocoapods/p/SwipeySearch.svg?style=flat)](https://cocoapods.org/pods/SwipeySearch)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwipeySearch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwipeySearch'
```
## Usage

#### 1 - Storyboard
you can add your search view using storyboard by adding a UIView then add a custom view to it (SwipeySearchView) with a module (SwipeySearch) and the search view will appear and you can customize it using attributes inspector in the following way 

#### 1 - Code
you can add your search view using code by creating a  having instance from the (SwipeySearchView) using the following way 
```
        let searchView = SwipeySearchView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)) // create object from SwipeySearchView 

        searchView.backgroundColor = .white // background for search view 

        searchView.isButtonCircle = true // bool to check if search bar will be rounded or circular 

        searchView.buttonCorner = 10 // change the corner radius of button and search field 

        searchView.buttonIcon = UIImage(named: "icons8-search-24") // add image to the button 

        searchView.buttonIconColor = .gray // change the color of button icon 

        searchView.buttonColor = .black // change the color of button  

        searchView.fieldPlaceHolderTxt = "Search" // placeholder for search field

        searchView.fieldPlaceHolderColor = .gray  // change color of the placholder text 

        searchView.searchFieldBgColor = .white // change search field background color 

        searchView.searchFieldFontColor = .black  // change color of font of search field 

        searchView.shadowColor = .blue // change shadow color for button and search field 

        searchView.shadowRadius = 5 // define the shadow radius for search field and button 

        searchView.shadowOpacity = 0.4 //. define the opacity of shadow for search field and button 

        searchView.shadowOffset = CGSize(width: 0.1, height: 0.3) // define the offset for search 

        self.view.addSubview(searchView) // add the search view to the main view 



```

####  Functionality
you have to implement the protocol (SwipeySearchProtocol) and make sure your ViewController have delegated to implement the functions 
```
 
1 - class ViewController: UIViewController,SwipeySearchProtocol

2 - add the view using connect from a storyboard or using code to can get delegation from it 

	2.1 - @IBOutlet weak var searchView: SwipeySearchView!
	
	or 

	2.2 - let searchView = SwipeySearchView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))


3 - searchView.delegate = self

4 - func handleDidPressSearch(textValue: String) {
        print("text press\(textValue)") 
	// called when you press the search button 
    }
    
    func handleDidChangeText(textValue: String) {
        print("text change\(textValue)")
	// called every time you type a character in search field 
    }
``` 


## Author

belalmedhat97, belal1997medhat@gmail.com

## License

SwipeySearch is available under the MIT license. See the LICENSE file for more info.
