//
//  ContentView.swift
//  ios-practice
//
//  Created by daiki kanai on 2022/03/05.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            MapView().ignoresSafeArea(edges: .top) .frame(height: 300)
            VStack(alignment: .leading){
                CircleImage().offset(x: 60, y: -130).padding(.bottom, -130)
                Text("Hello, World!").font(.title).foregroundColor(Color.orange)
                HStack {
                    Text("sub title").font(.subheadline).foregroundColor(Color.secondary)
                    Spacer()
                    Text("d.kanai").font(.subheadline).foregroundColor(Color.secondary)
                }
                Divider()
                Text("About").font(.title2)
                Text("Description here")
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
