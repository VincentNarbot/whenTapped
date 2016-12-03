# whenTapped

whenTapped is a Swift Library that is adding a closure to your UIButton, UILabel, UITextField, UIImageView.

### Install
```swift
pod 'whenTapped', :git => 'https://github.com/VincentNarbot/whenTapped.git'
```

###  Use
```swift
import whenTapped
```

```swift
//UIButton
let button = UIButton()
button.whenTapped {
  print("button was pressed")
}

//UILabel
let label = UILabel()
label.whenTapped {
  print("label was pressed")
}

...
```
