//
//  FormSheetView.swift
//  BottomSheetsSwiftUI
//
//  Created by Noman belim on 20/01/26.
//
import SwiftUI

struct FormSheetView: View {

    @State private var name = ""
    @State private var email = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Email", text: $email)
            }
            .navigationTitle("Add User")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
#Preview {
    FormSheetView()
}
