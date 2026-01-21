//
//  SettingsSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct SettingsSheetView: View {
    
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var soundEnabled = true
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                    Toggle("Sound Effects", isOn: $soundEnabled)
                }
                
                Section(header: Text("Account")) {
                    Button("Change Password") {}
                    Button("Privacy Settings") {}
                }
                
                Section {
                    Button("Sign Out") {}
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsSheetView()
}