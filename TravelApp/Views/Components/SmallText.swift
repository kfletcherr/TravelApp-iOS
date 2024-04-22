//
//  SmallText.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//

import SwiftUI

struct SmallText: View {
    var text: String // The text that will be displayed
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .font(.system(size: 17))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SmallText_Previews: PreviewProvider {
    static var previews: some View {
        SmallText(text: "Decision")
    }
}

