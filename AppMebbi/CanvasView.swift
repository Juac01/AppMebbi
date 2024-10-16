//
//  CanvasView.swift
//  AppMebbi
//
//  Created by JOSE JOAQUIN JULCAMORO BUSTAMANTE on 16/10/24.
//
import SwiftUI
import Foundation
import PencilKit

// CanvasView para o PencilKit
struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        return canvasView
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        //
    }
}
