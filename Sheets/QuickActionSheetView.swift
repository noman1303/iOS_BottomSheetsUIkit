//
//  QuickActionSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//
import SwiftUI

struct QuickActionSheetView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 25) {

            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(.gray.opacity(0.5))

            Button("Share") {}
            Button("Save") {}
            Button("Delete") {}
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
    QuickActionSheetView()
}
