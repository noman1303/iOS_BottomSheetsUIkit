 
//
//  ContentView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showOptions = false
    @State private var showForm = false
    @State private var showFilter = false
    @State private var showQuickActions = false
    @State private var showConfirmDialog = false
    @State private var showSettings = false
    @State private var showShare = false
    @State private var showSort = false
    @State private var showPicker = false
    @State private var showFeedback = false
    @State private var showDatePicker = false
    @State private var showListSelection = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {

                    // ORIGINAL SHEETS
                    Group {
                        Button("Options (OK / Cancel)") {
                            showOptions = true
                            print("SHoOption is True")
                        }

                        Button("Form Bottom Sheet") {
                            showForm = true
                        }

                        Button("Filter Bottom Sheet") {
                            showFilter = true
                        }

                        Button("Quick Actions Sheet") {
                            showQuickActions = true
                        }

                        Button("Confirmation Dialog") {
                            showConfirmDialog = true
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    // NEW SHEETS
                    Group {
                        Button("Settings Sheet") {
                            showSettings = true
                        }
                        
                        Button("Share Sheet") {
                            showShare = true
                        }
                        
                        Button("Sort Sheet") {
                            showSort = true
                        }
                        
                        Button("Picker Sheet") {
                            showPicker = true
                        }
                        
                        Button("Feedback / Rating Sheet") {
                            showFeedback = true
                        }
                        
                        Button("Date Picker Sheet") {
                            showDatePicker = true
                        }
                        
                        Button("List Selection Sheet") {
                            showListSelection = true
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Bottom Sheets")
        }
        // OPTIONS
        .sheet(isPresented: $showOptions) {
            if #available(iOS 16.0, *) {
                OptionsSheetView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            } else {
                OptionsSheetView()
            }
        }

        // FORM
        .sheet(isPresented: $showForm) {
            if #available(iOS 16.0, *) {
                FormSheetView()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            } else {
                FormSheetView()
            }
        }

        // FILTER
        .sheet(isPresented: $showFilter) {
            if #available(iOS 16.0, *) {
                FilterSheetView()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            } else {
                FilterSheetView()
            }
        }

        // QUICK ACTIONS
        .sheet(isPresented: $showQuickActions) {
            if #available(iOS 16.0, *) {
                QuickActionSheetView()
                    .presentationDetents([.medium])
            } else {
                QuickActionSheetView()
            }
        }

        // CONFIRMATION DIALOG
        .confirmationDialog(
            "Choose Action",
            isPresented: $showConfirmDialog
        ) {
            Button("Delete", role: .destructive) {}
            Button("Edit") {}
            Button("Cancel", role: .cancel) {}
        }
        
        // SETTINGS
        .sheet(isPresented: $showSettings) {
            if #available(iOS 16.0, *) {
                SettingsSheetView()
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            } else {
                SettingsSheetView()
            }
        }
        
        // SHARE
        .sheet(isPresented: $showShare) {
            if #available(iOS 16.0, *) {
                ShareSheetView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            } else {
                ShareSheetView()
            }
        }
        
        // SORT
        .sheet(isPresented: $showSort) {
            if #available(iOS 16.0, *) {
                SortSheetView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            } else {
                SortSheetView()
            }
        }
        
        // PICKER
        .sheet(isPresented: $showPicker) {
            if #available(iOS 16.0, *) {
                PickerSheetView()
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            } else {
                PickerSheetView()
            }
        }
        
        // FEEDBACK
        .sheet(isPresented: $showFeedback) {
            if #available(iOS 16.0, *) {
                FeedbackSheetView()
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            } else {
                FeedbackSheetView()
            }
        }
        
        // DATE PICKER
        .sheet(isPresented: $showDatePicker) {
            if #available(iOS 16.0, *) {
                DatePickerSheetView()
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            } else {
                DatePickerSheetView()
            }
        }
        
        // LIST SELECTION
        .sheet(isPresented: $showListSelection) {
            if #available(iOS 16.0, *) {
                ListSelectionSheetView()
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            } else {
                ListSelectionSheetView()
            }
        }
    }
    
}

#Preview {
    ContentView()
}
 
