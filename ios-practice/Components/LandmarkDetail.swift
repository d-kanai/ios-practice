import SwiftUI
import CoreData

struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapComponent(coordinate: landmark.locationCoordinate).ignoresSafeArea(edges: .top).frame(height: 300)
            CircleImage(image: landmark.image).offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name).font(.title).foregroundColor(Color.orange)
                HStack {
                    Text(landmark.park).font(.subheadline).foregroundColor(Color.secondary)
                    Spacer()
                    Text(landmark.state).font(.subheadline).foregroundColor(Color.secondary)
                }
                Divider()
                Text("About \(landmark.name)").font(.title2)
                Text(landmark.description)
            }.padding()
        }.navigationTitle(landmark.name).navigationBarTitleDisplayMode(.inline)
    }
    
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}

