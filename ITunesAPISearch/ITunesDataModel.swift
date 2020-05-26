

import Foundation


struct ITunesResponse: Decodable {
    let resultCount: Int?
    let results: [App]?
}
struct App: Decodable {
 let trackCensoredName: String?
 let artistName: String?
 let artworkUrl100: URL?
 let previewUrl: URL?
    let trackName: String?
    let releaseDate: String?
    let trackPrice: Float?
    let collectionPrice: Float?
    let collectionCensoredName: String?
    let primaryGenreName: String?
}
struct ITunes: Decodable {
    var holidays: [App]
}

struct ITuneDetail: Decodable {
 
}

struct DateInfo: Decodable {
    var iso: String
}
