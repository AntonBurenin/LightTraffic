//
//  CircleColor.swift
//  trafficLight
//
//  Created by Anton on 21.07.2020.
//  Copyright © 2020 Anton. All rights reserved.
//

import SwiftUI

struct CircleColor: View {
      let color: UIColor
      
    var body: some View {
        Color(color)
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
      }
}

struct CircleColor_Previews: PreviewProvider {
    static var previews: some View {
        CircleColor(color: UIColor.orange)
    }
}
