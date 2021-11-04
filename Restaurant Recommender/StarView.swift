//
//  StarView.swift
//  Restaurant Recommender
//
//  Created by Thomas Smith on 10/7/21.
//

import SwiftUI

struct StarView: View {
    let fillRatio: CGFloat
    
    init(fillRatio: CGFloat = 1.0) {
        assert(fillRatio >= 0.0 && fillRatio <= 1.0, "fillRatio must be between 0.0 and 1.0 inclusive")
        self.fillRatio = fillRatio
    }
    
    private func getImage(color: Color, width: CGFloat, height: CGFloat) -> some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(color)
    }
    
    private let imageName = "star.fill"
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            ZStack {
                getImage(color: Color("blue"), width: width, height: height)
                getImage(color: Color("maize"), width: width, height: height)
                    .clipShape(Rectangle().size(width: width * fillRatio, height: height))
                    
            }
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            StarView()
            StarView(fillRatio: 0.6)
        }.frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
