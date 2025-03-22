//
//  ContentView.swift
//  Landmarks
//
//  Created by Konstantin Kolosov on 27.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("TestLand!")
                    .font(.title)
                HStack {
                    Text("True Glory")
                    Spacer()
                    Text("Ukraine")
                }.font(.subheadline)
                    .foregroundColor(.secondary)

                Divider().padding(.horizontal)

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
