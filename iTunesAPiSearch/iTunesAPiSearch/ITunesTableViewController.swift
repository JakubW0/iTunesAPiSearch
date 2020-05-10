
import UIKit

class ITunesTableViewController: UITableViewController{



    @IBOutlet weak var searchBar: UISearchBar!
    
    var listOfITunes = [App]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfITunes.count) positions found"
            }
        }
    }
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
 

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfITunes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let app = listOfITunes[indexPath.row]
        cell.textLabel?.text = app.artistName
        cell.detailTextLabel?.text = app.trackCensoredName
        // image !!!
        return cell
    }
}
// put the search bar delegate in an extension
extension ITunesTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // when search button is clicked
        
        guard let searchBarText = searchBar.text
            else {return}
        let iTunesRequest = ITunesRequest(name: searchBarText)
        iTunesRequest.getITunes { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let app):
                self?.listOfITunes = app
            }
        }
    }
 
}

