//
//  ListSelectionSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct ListSelectionSheetView: View {
    
    @State private var selectedItems = Set<String>()
    @Environment(\.dismiss) var dismiss
    
    let items = ["Apple", "Banana", "Orange", "Grapes", "Mango", "Pineapple", "Strawberry"]
    
    var body: some View {
        NavigationView {
            VStack {
                List(items, id: \.self) { item in
                    HStack {
                        Text(item)
                        
                        Spacer()
                        
                        if selectedItems.contains(item) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if selectedItems.contains(item) {
                            selectedItems.remove(item)
                        } else {
                            selectedItems.insert(item)
                        }
                    }
                }
                
                HStack {
                    Button("Clear All") {
                        selectedItems.removeAll()
                    }
                    .foregroundColor(.red)
                    
                    Spacer()
                    
                    Button("Done (\(selectedItems.count))") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("Select Items")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListSelectionSheetView()
}