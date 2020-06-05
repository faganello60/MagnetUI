![Logo](https://raw.githubusercontent.com/Code-With-Coffee/MagnetUI/master/Logo.png)
# A simple Design System for SwiftUI

### You can clone or download this repo and you will find a MagnetUI.sketchapp to see the design system. Other folder is the MagnetUI folder with the resource files. You can just drag and drop to your app folder. 

### Solar System Exploration, 1950s – 1960s

- [X] Buttons
- [x] Typography
- [x] Colors
- [ ] Views
- [ ] Checkbox
- [ ] Switch
- [ ] Navigation
- [ ] Images

## Buttons
We have many kind of buttons:


```swift
HStack {
                MGButton(title: "Fill", style: .full, action: { print("click") })
                MGButton(title: "Fill", style: .full, color: .danger, action: { print("click") })
                MGButton(title: "Fill", style: .full, color: .success, action: { print("click") })
                    .disabled(true)
            }
            
            HStack {
                MGButton(title: "Border", style: .border, action: { print("click") })
                MGButton(title: "Border", style: .border, color: .danger, action: { print("click") })
                    .disabled(true)
                MGButton(title: "Border", style: .border, color: .success, action: { print("click") })
                
            }
            
            HStack {
                MGButton(title: "Simple", style: .simple, action: { print("click") })
                MGButton(title: "Simple", style: .simple, color: .danger, action: { print("click") })
                MGButton(title: "Simple", style: .simple, color: .error, action: { print("click") })
                    .disabled(true)
            }
            
            HStack {
                MGButton(title: "A", style: .circle, action: { print("click") })
                MGButton(title: "B", style: .circle, color: .error, action: { print("click") })
                MGButton(title: "C", style: .circle, color: .success, action: { print("click") })
                    .disabled(true)
            }
            
            HStack {
                MGButton(title: "A", style: .borderCircle, action: { print("click") })
                    .disabled(true)
                MGButton(title: "B", style: .borderCircle, color: .danger, action: { print("click") })
                MGButton(title: "C", style: .borderCircle, color: .success, action: { print("click") })
            }
            
        }
```


## Typography

```swift
VStack {
            Text("Typography")
                .style(.h1)
            Text("Typography")
                .style(.h2)
            Text("Typography")
                .style(.h3)
            Text("Typography")
                .style(.s1)
            Text("Typography")
                .style(.s2)
            Text("Typography")
                .style(.p1)
            Text("Typography")
                .style(.c1)
        }
```
