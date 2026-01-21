//
//  PickerSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct PickerSheetView: View {
    
    @State private var selectedColor = "Red"
    @State private var selectedSize = "Medium"
    @Environment(\.dismiss) var dismiss
    
    let colors = ["Red", "Blue", "Green", "Yellow", "Purple"]
    let sizes = ["Small", "Medium", "Large", "XL"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Select Options")
                    .font(.title2)
                    .bold()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Color")
                        .font(.headline)
                    
                    Picker("Color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Size")
                        .font(.headline)
                    
                    Picker("Size", selection: $selectedSize) {
                        ForEach(sizes, id: \.self) { size in
                            Text(size)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                .padding()
                
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                    
                    Spacer()
                    
                    Button("Select") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    PickerSheetView()
}