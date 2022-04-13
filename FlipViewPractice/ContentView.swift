//
//  ContentView.swift
//  FlipView
//
//  Created by littleossa on 2022/04/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isFlippedHorizontal = false
    @State private var isFlippedVertical = false
    @State private var rotationDegrees: Double = 0
    
    typealias Axis = (x: CGFloat, y: CGFloat, z: CGFloat)
    
    private var effectAxis: Axis {
        if isFlippedHorizontal && isFlippedVertical {
            return (x: 0, y: 0, z: 1)
        } else if isFlippedHorizontal {
            return (x: 0, y: 1, z: 0)
        } else if isFlippedVertical {
            return (x: 1, y: 0, z: 0)
        }
        return (x: 0, y: 0, z: 0)
    }
    
    
    var body: some View {
        
        VStack(spacing: 32) {
            
            Image(systemName: "figure.walk")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .rotation3DEffect(.degrees(180),
                                  axis: effectAxis)
                .rotationEffect(.degrees(rotationDegrees))
            
            HStack(spacing: 32) {
                
                Group {
                    
                    /// 左右反転ボタン
                    Button {
                        isFlippedHorizontal.toggle()
                    } label: {
                        Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")
                            .resizable()
                    }
                    
                    /// 上下反転ボタン
                    Button {
                        isFlippedVertical.toggle()
                    } label: {
                        Image(systemName: "arrow.up.and.down.righttriangle.up.righttriangle.down.fill")
                            .resizable()
                    }
                    
                    /// 45°回転ボタン
                    Button {
                        let addedDegrees = rotationDegrees + 45
                        rotationDegrees = addedDegrees > 360 ? 45 : addedDegrees
                    } label: {
                        Image(systemName: "rotate.right.fill")
                            .resizable()
                    }
                }
                .scaledToFit()
                .frame(width: 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
