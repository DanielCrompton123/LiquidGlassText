//
//  SwiftUIView.swift
//  LiquidGlassText
//
//  Created by Daniel Crompton on 9/6/25.
//

import SwiftUI
// Core text needed to convert text into a path
import CoreText


public struct LiquidGlassText: View {
    
    //MARK: - Properties
    private let string: NSAttributedString
    private let glass: Glass
    
    //MARK: - Initializers
    public init(_ string: NSAttributedString, glass: Glass = .regular) {
        self.string = string
        self.glass = glass
    }
    
    public init(_ string: String, glass: Glass = .regular) {
        self.string = NSAttributedString(string: string)
        self.glass = glass
    }
    
    public init(
        _ string: String,
        glass: Glass = .regular,
        
        size: CGFloat = UXFont.systemFontSize,
        weight: UXWeight = .regular,
        width: UXWidth = .standard,
        design: UXDesign = .default
    ) {
        let attrs: [NSAttributedString.Key: Any] = [
            .font: FontHelper.font(forSize: size, weight: weight, width: width, design: design)
        ]
        self.string = NSAttributedString(string: string, attributes: attrs)
        self.glass = glass
    }
    
    public init(_ string: String, glass: Glass = .regular, fontName: String, size: CGFloat = UXFont.systemFontSize) {
        let attrs: [NSAttributedString.Key: Any] = [
            .font: FontHelper.font(named: fontName, size: size) as Any
        ]
        self.string = NSAttributedString(string: string, attributes: attrs)
        self.glass = glass
    }
    
    // MARK: - Body
    public var body: some View {
        let path = TextHelper.path(for: string)
        
        Color.clear
            .glassEffect(glass, in: path)
            .frame(width: path.boundingRect.width, height: path.boundingRect.height)
    }
    
}
