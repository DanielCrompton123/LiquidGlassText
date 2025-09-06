//
//  File.swift
//  LiquidGlassText
//
//  Created by Daniel Crompton on 9/6/25.
//

import SwiftUI

fileprivate func prevImg(name: String, ext: String) -> Image {
    let path = Bundle.module.url(forResource: name, withExtension: ext)!.path(percentEncoded: false)

    #if os(iOS)
    return Image(uiImage: UIImage(contentsOfFile: path)!)
    #elseif os(macOS)
    return Image(nsImage: NSImage(contentsOfFile: path)!)
    #endif
}

// MARK: Lock screen
#Preview("Lock screen") {
    
    VStack {
        LiquidGlassText(NSAttributedString(string: "16:49", attributes: [.font: UXFont.boldSystemFont(ofSize: 120)]))
        
        Spacer()
        
        HStack {
            Image(systemName: "flashlight.off.fill")
                .frame(width: 60, height: 60)
                .glassEffect(in: .circle)
            Spacer()
            Image(systemName: "camera.fill")
                .frame(width: 60, height: 60)
                .glassEffect(in: .circle)
        }
        .font(.system(size: 30)) // for the icons
    }
    .padding(40)
    .padding(.top, 40)
    .background {
        prevImg(name: "img", ext: "jpeg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}
// MARK: Yellow tint, black weight
#Preview("Yellow tint, black weight") {
    
    VStack {
        LiquidGlassText(
            "Liquid glass",
            glass: .clear.tint(.yellow),
            size: 60,
            weight: .black
        )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        prevImg(name: "img2", ext: "jpg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

// MARK: Interactive teal tint on droplets, rounded design, black weight
#Preview("Interactive teal tint, rounded design, black weight") {
    
    VStack {
        LiquidGlassText(
            "Liquid glass",
            glass: .clear.tint(.teal).interactive(),
            size: 60,
            weight: .black,
            design: .rounded
        )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        prevImg(name: "img3", ext: "jpg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

// MARK: Very big, monospace, teal tint on droplets
#Preview("Interactive teal tint, rounded design, black weight") {
    
    VStack {
        LiquidGlassText(
            "Wet",
            glass: .clear.tint(.teal).interactive(),
            size: 150,
            weight: .black,
            design: .monospaced
        )
        
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        prevImg(name: "img3", ext: "jpg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

// MARK: Very big, weight light, serif, orange tint on history building
#Preview("Very big, serif, orange tint on history building") {
    
    VStack {
        LiquidGlassText(
            "Come",
            glass: .clear.tint(.orange).interactive(),
            size: 150,
            weight: .light,
            design: .serif
        )
        LiquidGlassText(
            "visit",
            glass: .clear.tint(.yellow).interactive(),
            size: 150,
            weight: .black,
            design: .serif
        )
        LiquidGlassText(
            "us!",
            glass: .clear.tint(.orange).interactive(),
            size: 150,
            weight: .light,
            design: .serif
        )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        prevImg(name: "img4", ext: "jpg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

// MARK: Weight/design variations, on gradient background
#Preview("Weight/design variations, on gradient background") {
    ZStack {
        LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple], startPoint: .top, endPoint: .bottom)
        
        VStack {
            LiquidGlassText("Compressed", size: 80, width: .compressed)
            LiquidGlassText("Condensed", size: 80, width: .condensed)
            LiquidGlassText("Standard", size: 80, width: .standard)
            LiquidGlassText("Expanded", size: 80, width: .expanded)
        }
    }
}

