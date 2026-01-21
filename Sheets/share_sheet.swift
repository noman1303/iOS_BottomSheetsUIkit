//
//  ShareSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct ShareSheetView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let shareOptions = [
        ("message.fill", "Message", Color.green),
        ("envelope.fill", "Email", Color.blue),
        ("link", "Copy Link", Color.orange),
        ("square.and.arrow.up", "More", Color.gray)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray.opacity(0.5))
            
            Text("Share")
                .font(.title2)
                .bold()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                ForEach(shareOptions, id: \.0) { icon, title, color in
                    VStack {
                        Image(systemName: icon)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(color)
                            .clipShape(Circle())
                        
                        Text(title)
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal)
            
            Button("Cancel") {
                dismiss()
            }
            .foregroundColor(.red)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ShareSheetView()
}