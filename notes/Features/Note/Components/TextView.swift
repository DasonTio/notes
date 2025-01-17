//
//  TextView.swift
//  notes
//
//  Created by Dason Tiovino on 12/07/24.
//

import Foundation
import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var attributedText: NSMutableAttributedString
    @State var allowsEditingTextAttributes: Bool = false
    @State var font: UIFont?
    
    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = attributedText
        uiView.allowsEditingTextAttributes = allowsEditingTextAttributes
        uiView.font = font
    }
}
