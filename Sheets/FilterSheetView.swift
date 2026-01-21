//
//  FilterSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//

import SwiftUI
import SwiftUI

struct FilterSheetView: View {

    @State private var isAvailable = true
    @State private var price: Double = 50
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {

            Text("Filters")
                .font(.title2)
                .bold()

            Toggle("Available Only", isOn: $isAvailable)

            VStack {
                Text("Price: ₹\(Int(price))")
                Slider(value: $price, in: 0...100)
            }

            HStack {
                Button("Reset") {
                    isAvailable = false
                    price = 0
                }

                Spacer()

                Button("Apply") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }

            Spacer()
        }
        .padding()
    }
}
