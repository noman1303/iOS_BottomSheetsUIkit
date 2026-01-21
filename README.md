# 📱 BottomSheetsUIKit

A comprehensive UIKit-based iOS project demonstrating all common bottom sheet patterns using modern `UISheetPresentationController` and programmatic UI. Built with clean architecture, reusable components, and no storyboard dependencies for sheet layouts.

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2015.0+-lightgrey.svg)
![UIKit](https://img.shields.io/badge/UIKit-Framework-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

---

## 🎯 Project Overview

This project mirrors SwiftUI-style bottom sheets but is built entirely with UIKit, showcasing modern iOS development patterns with `UISheetPresentationController` (iOS 15+).

### Key Features

- ✅ Modern `UISheetPresentationController` API
- ✅ Programmatic UI (no Interface Builder for sheets)
- ✅ 11+ bottom sheet implementations
- ✅ Clean, scalable architecture
- ✅ Reusable UI helper methods
- ✅ Type-safe presentation (no string identifiers)
- ✅ Production-ready code patterns

---

## 📂 Project Structure

```
BottomSheetsUIKit/
├── AppDelegate.swift
├── SceneDelegate.swift
├── ViewController.swift              // Main screen with buttons
│
├── Sheets/                           // Bottom sheet view controllers
│   ├── OptionsSheetViewController.swift
│   ├── FormSheetViewController.swift
│   ├── FilterSheetViewController.swift
│   ├── QuickActionSheetViewController.swift
│   ├── SettingsSheetViewController.swift
│   ├── ShareSheetViewController.swift
│   ├── SortSheetViewController.swift
│   ├── PickerSheetViewController.swift
│   ├── FeedbackSheetViewController.swift
│   ├── DatePickerSheetViewController.swift
│   └── ListSelectionSheetViewController.swift
│
└── Resources/
    ├── Assets.xcassets
    └── Main.storyboard               // Only for main navigation
```

---

## 📋 Implemented Bottom Sheets

### Core Sheets (5)

| # | Sheet Name | Description | Key Components |
|---|------------|-------------|----------------|
| 1 | **OptionsSheet** | OK / Cancel confirmation | UIButton, UIStackView |
| 2 | **FormSheet** | User input form | UITextField, UIButton |
| 3 | **FilterSheet** | Toggle & slider filters | UISwitch, UISlider |
| 4 | **QuickActionSheet** | Fast actions menu | UIButton, UIStackView |
| 5 | **DatePickerSheet** | Date/time selection | UIDatePicker |

### Extended Sheets (6)

| # | Sheet Name | Description | Key Components |
|---|------------|-------------|----------------|
| 6 | **SettingsSheet** | App preferences | UISwitch, UITableView |
| 7 | **ShareSheet** | Share options | UITableView, Icons |
| 8 | **SortSheet** | Sort selection | UITableView, Checkmarks |
| 9 | **PickerSheet** | Segmented & wheel pickers | UISegmentedControl, UIPickerView |
| 10 | **FeedbackSheet** | User feedback form | UITextView, UIButton |
| 11 | **ListSelectionSheet** | Multi-select list | UITableView, Checkboxes |

---

## 🧠 How It Works

### 1. One Sheet = One ViewController

Each bottom sheet is implemented as its own `UIViewController`, following single responsibility principle.

```swift
final class SettingsSheetViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        applyBottomSheetStyle()
    }
}
```

**SwiftUI Equivalent:**
```swift
.sheet {
    SettingsSheetView()
}
```

---

### 2. Presenting Bottom Sheets

Sheets are presented directly with type-safe initialization:

```swift
@IBAction func openSettings(_ sender: UIButton) {
    let settingsVC = SettingsSheetViewController()
    present(settingsVC, animated: true)
}
```

**Benefits:**
- ❌ No string-based lookups
- ✅ Compile-time safety
- ✅ Easy to maintain

---

### 3. Reusable Sheet Configuration

All bottom sheet styling is centralized using a reusable helper:

```swift
func applyBottomSheetStyle() {
    modalPresentationStyle = .pageSheet
    
    if let sheet = sheetPresentationController {
        sheet.detents = [.medium(), .large()]
        sheet.prefersGrabberVisible = true
        sheet.preferredCornerRadius = 20
    }
}
```

**Usage in any sheet:**
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    applyBottomSheetStyle()
}
```

**Configuration Options:**
- `.detents` - Sheet height options (medium, large, custom)
- `.prefersGrabberVisible` - Shows drag indicator
- `.preferredCornerRadius` - Custom corner radius
- `.largestUndimmedDetentIdentifier` - Background dimming behavior

---

### 4. Programmatic UI with Helpers

All sheet UIs are created programmatically using reusable helper methods:

#### Helper Methods

```swift
// Create styled title label
func makeTitle(_ text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = .boldSystemFont(ofSize: 24)
    label.textAlignment = .center
    return label
}

// Create card container
func makeCard(_ views: [UIView]) -> UIView {
    let card = UIView()
    card.backgroundColor = .systemBackground
    card.layer.cornerRadius = 12
    // ... add subviews
    return card
}

// Create toggle row
func makeToggleRow(_ title: String) -> UIView {
    let row = UIView()
    let label = UILabel()
    let toggle = UISwitch()
    // ... configure and layout
    return row
}

// Create styled button
func makeRowButton(_ title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    button.layer.cornerRadius = 8
    return button
}
```

#### Example Usage

```swift
let titleLabel = makeTitle("Settings")
let toggleRow = makeToggleRow("Notifications")
let buttonRow = makeRowButton("Save")
let card = makeCard([titleLabel, toggleRow, buttonRow])
```

**Benefits:**
- ✅ Consistent styling across sheets
- ✅ Composable UI components 
- ✅ Easy to modify globally

---

## 🗓 DatePicker Implementation Note

### UIKit Limitation

**SwiftUI** provides a beautiful graphical calendar-style `DatePicker`:
```swift
DatePicker("Select Date", selection: $date)
    .datePickerStyle(.graphical)
```

**UIKit** does not have a public equivalent of the graphical calendar style.

### Solution

This project uses `UIDatePicker` with wheel style for maximum compatibility:

```swift
let picker = UIDatePicker()
picker.preferredDatePickerStyle = .wheels
picker.datePickerMode = .dateAndTime
```

**Minimum height constraint** prevents clipping:
```swift
card.heightAnchor.constraint(greaterThanOrEqualToConstant: 260).isActive = true
```

**Why not `.inline`?**
- ⚠️ `.inline` style may not render correctly inside bottom sheets on all iOS versions
- ⚠️ Can cause layout issues with dynamic height
- ✅ `.wheels` provides consistent, predictable behavior

---

## 🎨 UI Architecture

### Design Pattern: Programmatic Composition

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    applyBottomSheetStyle()
    
    // 1. Create components
    let title = makeTitle("Filter Options")
    let priceSlider = makePriceSlider()
    let toggleRow = makeToggleRow("Available Only")
    
    // 2. Compose into container
    let card = makeCard([title, priceSlider, toggleRow])
    
    // 3. Add to view hierarchy
    view.addSubview(card)
    
    // 4. Apply constraints
    setupConstraints()
}
```

This mirrors SwiftUI's composition model while staying in UIKit.

---

## 🚀 Getting Started

### Requirements

- **Xcode:** 14.0+
- **iOS:** 15.0+
- **Swift:** 5.9+
- **UIKit:** Native framework
 
---

## 💡 Key UIKit Concepts Demonstrated

### UISheetPresentationController (iOS 15+)

Modern API for bottom sheets with native iOS behavior:

```swift
if let sheet = sheetPresentationController {
    // Multiple height options
    sheet.detents = [.medium(), .large()]
    
    // Custom heights (iOS 16+)
    sheet.detents = [
        .custom { context in
            return 300
        }
    ]
    
    // Drag indicator
    sheet.prefersGrabberVisible = true
    
    // Corner radius
    sheet.preferredCornerRadius = 20
    
    // Dismiss on drag
    sheet.prefersEdgeAttachedInCompactHeight = true
}
```

### Programmatic Auto Layout

```swift
// Modern constraint activation
NSLayoutConstraint.activate([
    card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
    card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
])
```

### Delegation Pattern

```swift
protocol FilterSheetDelegate: AnyObject {
    func didApplyFilters(price: Double, availableOnly: Bool)
}

class FilterSheetViewController: UIViewController {
    weak var delegate: FilterSheetDelegate?
    
    @objc func applyTapped() {
        delegate?.didApplyFilters(price: currentPrice, availableOnly: isAvailable)
        dismiss(animated: true)
    }
}
```
 
