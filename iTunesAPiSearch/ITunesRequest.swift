
import Foundation

enum ITunesError: Error {
    case noDataAvailable
    case cannotProcessData
}

struct ITunesRequest {
    let resourceURL: URL
    
    init(name: String) {

        
                let resourceString = "https://itunes.apple.com/search?term=\(name)&limit=5&mediaType=music"

        let replaced = resourceString.replacingOccurrences(of: " ", with: "+") // SPACJE TRZEBA NA + ZAMIENIC W LINKU

                guard let resourceURL = URL(string: replaced) else {fatalError()}
                
                self.resourceURL = resourceURL
        // TRZEBA JAKIS DATA MODEL ZROBIC
            }
               
        }
