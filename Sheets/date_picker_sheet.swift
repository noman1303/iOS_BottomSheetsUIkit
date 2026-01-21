//
//  DatePickerSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct DatePickerSheetView: View {
    
    @State private var selectedDate = Date()
    @State private var includeTime = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Select Date")
                .font(.title2)
                .bold()
            
            Divider()
            
            Toggle("Include Time", isOn: $includeTime)
                .padding(.horizontal)
            
            if includeTime {
                DatePicker("Date & Time", selection: $selectedDate)
                    .datePickerStyle(.graphical)
                    .padding()
            } else {
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .padding()
            }
    
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(.red)
                
                Spacer()
                
                Button("Confirm") {
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
    DatePickerSheetView()
}
