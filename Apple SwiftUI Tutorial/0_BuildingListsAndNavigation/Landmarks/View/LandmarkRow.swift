//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Konstantin Kolosov on 27.03.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack(spacing: 10) {
            landmark.image.resizable() .frame(width: 50, height: 50).cornerRadius(25)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
