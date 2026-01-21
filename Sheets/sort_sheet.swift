//
//  SortSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct SortSheetView: View {
    
    @State private var selectedSort = "Name"
    @Environment(\.dismiss) var dismiss
    
    let sortOptions = ["Name", "Date", "Size", "Type", "Recently Modified"]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Sort By")
                .font(.title2)
                .bold()
            
            Divider()
            
            ForEach(sortOptions, id: \.self) { option in
                HStack {
                    Text(option)
                        .font(.body)
                    
                    Spacer()
                    
                    if selectedSort == option {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedSort = option
                }
            }
            
            Divider()
            
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(.red)
                
                Spacer()
                
                Button("Apply") {
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

#Preview {
    SortSheetView()
}