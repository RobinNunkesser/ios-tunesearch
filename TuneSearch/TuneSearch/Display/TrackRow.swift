import SwiftUI
import URLImage

struct TrackRow: View {
    var text : String
    var detailText: String
    var url: URL
    
    var body: some View {
        HStack {
            URLImage(url)
            VStack(alignment: .leading) {
                Text(verbatim: text)
                    .font(.subheadline)
                Text(verbatim: detailText)
                    .font(.caption)
            }
        }
    }
}

struct TrackRow_Previews: PreviewProvider {
    static var previews: some View {
        TrackRow(text: "Some Text", detailText: "Some Detail Text", url: URL(string: "https://www.apple.com")!)
    }
}
