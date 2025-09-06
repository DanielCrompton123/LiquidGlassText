//
//  File.swift
//  LiquidGlassText
//
//  Created by Daniel Crompton on 9/6/25.
//

import SwiftUI

#if os(iOS) || os(visionOS) || os(tvOS)
    public typealias UXFont = UIFont
    public typealias UXDesign = UIFontDescriptor.SystemDesign
    public typealias UXWeight = UIFont.Weight
    public typealias UXWidth = UIFont.Width
    public typealias UXDescriptor = UIFontDescriptor
#elseif os(macOS)
    public typealias UXFont = NSFont
    public typealias UXDesign = NSFontDescriptor.SystemDesign
    public typealias UXWeight = NSFont.Weight
    public typealias UXWidth = NSFont.Width
    public typealias UXDescriptor = NSFontDescriptor
#endif

struct FontHelper {
    
    
    private init() { }
    
    static func font(forSize size: CGFloat, weight: UXWeight, width: UXWidth, design: UXDesign) -> UXFont {
        
        let baseDescriptor = UXFont.systemFont(ofSize: size).fontDescriptor
        
        let descriptorWithDesign = baseDescriptor.withDesign(design) ?? baseDescriptor
        let descriptor = descriptorWithDesign.addingAttributes([
            UXDescriptor.AttributeName.traits: [
                UXDescriptor.TraitKey.weight: weight,
                UXDescriptor.TraitKey.width: width
            ]
        ])
        
        return UXFont(descriptor: descriptor, size: size) ?? UXFont.systemFont(ofSize: size)
    }
    
    static func font(named name: String, size: CGFloat) -> UXFont {
        UXFont(name: name, size: size) ?? .systemFont(ofSize: size)
    }
}
