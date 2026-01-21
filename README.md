📱 BottomSheetsUIKit

A UIKit-based iOS project demonstrating all common bottom sheet patterns used in real-world applications — implemented using modern UISheetPresentationController and programmatic UI (no Storyboard for sheet layouts).

This project mirrors SwiftUI-style sheets but is built entirely with UIKit, following clean architecture and reusable helpers.

⸻

🚀 Features
    •    ✅ Uses UIKit + UISheetPresentationController
    •    ✅ Covers all common bottom sheet use cases
    •    ✅ Each sheet has its own ViewController
    •    ✅ Reusable UI helper methods
    •    ✅ iOS 15+ bottom sheet support
    •    ✅ Clean, scalable architecture
    •    ✅ No storyboard IDs for sheets (safe & crash-free)

⸻

📂 Project Structure

BottomSheetsUIKit
│
├── ViewController.swift        // Main screen with buttons
│
├── Sheets/                     // All bottom sheet controllers
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
└── Assets / Storyboard (only for main buttons)


⸻

📋 Implemented Bottom Sheets

Original Sheets
    •    Options Sheet – OK / Cancel actions
    •    Form Sheet – Add User (Name & Email)
    •    Filter Sheet – Toggle + Slider filters
    •    Quick Actions Sheet – Share, Save, Delete
    •    Date Picker Sheet – UIDatePicker in bottom sheet

Extended Sheets
    •    Settings Sheet – Toggle-based preferences
    •    Share Sheet – Share options list
    •    Sort Sheet – Sorting selection
    •    Picker Sheet – Segmented + Picker view
    •    Feedback Sheet – Text feedback submission
    •    List Selection Sheet – Multiple selectable items

⸻

🧠 How It Works (Core Concept)

1️⃣ One Sheet = One ViewController

Each bottom sheet is implemented as its own UIViewController.

final class SettingsSheetViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        applyBottomSheetStyle()
    }
}

This mirrors SwiftUI’s:

.sheet {
    SettingsSheetView()
}


⸻

2️⃣ Presenting a Bottom Sheet

Sheets are presented directly from the main ViewController:

@IBAction func openSettings(_ sender: UIButton) {
    let vc = SettingsSheetViewController()
    present(vc, animated: true)
}

❌ No generic presenter
❌ No storyboard identifiers
✅ Each button opens its own sheet

⸻

3️⃣ Bottom Sheet Configuration (Reusable)

All bottom sheet styling is centralized in one helper method inside ViewController:

func applyBottomSheetStyle() {
    modalPresentationStyle = .pageSheet
    if let sheet = sheetPresentationController {
        sheet.detents = [.medium(), .large()]
        sheet.prefersGrabberVisible = true
        sheet.preferredCornerRadius = 20
    }
}

Each sheet simply calls:

applyBottomSheetStyle()

✔ Clean
✔ No duplication
✔ Easy to change globally

⸻

4️⃣ Programmatic UI (SwiftUI-like)

All sheet UIs are created in code, using reusable helpers:

Example helpers

func makeTitle(_ text: String) -> UILabel
func makeCard(_ views: [UIView]) -> UIView
func makeRowButton(_ title: String) -> UIButton
func makeToggleRow(_ title: String) -> UIView

Example usage

let title = makeTitle("Settings")
let row = makeToggleRow("Notifications")
let card = makeCard([row])

This mimics SwiftUI’s composition-based UI.

⸻

📅 DatePicker Sheet – UIKit Limitation Explained

SwiftUI provides a graphical calendar-style DatePicker.

UIKit does not have a public equivalent.

So this project uses:

UIDatePicker()
picker.preferredDatePickerStyle = .wheels

To ensure:
    •    ✅ Compatibility across SDKs
    •    ✅ No compile-time errors
    •    ✅ Stable behavior inside bottom sheets

A minimum height constraint is added to avoid clipping:

card.heightAnchor.constraint(greaterThanOrEqualToConstant: 260)
 
