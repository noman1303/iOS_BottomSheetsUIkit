//
//  FeedbackSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct FeedbackSheetView: View {
    
    @State private var rating = 3
    @State private var feedback = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Rate Your Experience")
                    .font(.title2)
                    .bold()
                
                HStack(spacing: 15) {
                    ForEach(1..<6) { index in
                        Image(systemName: index <= rating ? "star.fill" : "star")
                            .font(.system(size: 35))
                            .foregroundColor(index <= rating ? .yellow : .gray)
                            .onTapGesture {
                                rating = index
                            }
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Comments (Optional)")
                        .font(.headline)
                    
                    TextEditor(text: $feedback)
                        .frame(height: 120)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
                .padding()
                
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                    
                    Spacer()
                    
                    Button("Submit") {
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
    FeedbackSheetView()
}