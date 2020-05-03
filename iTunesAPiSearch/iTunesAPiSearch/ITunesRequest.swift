
import Foundation

enum ITunesError: Error {
    case noDataAvailable
    case cannotProcessData
}

struct ITunesRequest {
    let resourceURL: URL

    
    init(name: String) {

                let resourceString = "https://itunes.apple.com/search?term=\(name)&limit=5&mediaType=music"

        let replaced = resourceString.replacingOccurrences(of: " ", with: "+")

                guard let resourceURL = URL(string: replaced) else {fatalError()}
                
                self.resourceURL = resourceURL
            }
            
            
            // API Request - getter
            func getITunes (completion: @escaping(Result<[App], ITunesError>) -> Void) {
                // happends async with main thread
                  URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
                    guard let data = data else { return }
                    
                    do {
               
                
                                let decodedResponse = try JSONDecoder().decode(ITunesResponse.self, from: data)
                        let app = decodedResponse.results.unsafelyUnwrapped
                        completion(.success(app))
                    } catch {
                        completion(.failure(.cannotProcessData))
                    }
                    
                }
                .resume()
            }
               
        }
