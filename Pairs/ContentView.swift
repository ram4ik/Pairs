//
//  ContentView.swift
//  Pairs
//
//  Created by ramil on 17.04.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CardBack()
        }
    }
}

struct CardBack: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.blue)
            .frame(width: 140, height: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(Color.white, lineWidth: 2)
            )
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    let rowCount = 4
    let columnCount = 6
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(white: 0.3), .black]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                Image(decorative: "pairs")
                
                GridStack(rows: rowCount, columns: columnCount) { row, column in
                    CardView()
                }
            }.padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
