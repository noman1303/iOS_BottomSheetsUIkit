//
//  OptionsSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI

struct OptionsSheetView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            
            // Drag Indicator
            Capsule()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 5)
                .padding(.top, 12)
                .padding(.bottom, 20)
            
            // Icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.7)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
                
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 20)
            
            // Title
            Text("Options")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            // Description
            Text("Choose an action to continue")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
            
            // Buttons
            VStack(spacing: 12) {
                // OK Button
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("OK")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(14)
                    .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                
                // Cancel Button
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("Cancel")
                            .font(.headline)
                    }
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    OptionsSheetView()
}
