//
//  CategoryView.swift
//  Landmarks
//
//  Created by Konstantin Kolosov on 26.04.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }.listRowInsets(EdgeInsets())
            .navigationTitle("Featured")
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(ModelData())
    }
}
