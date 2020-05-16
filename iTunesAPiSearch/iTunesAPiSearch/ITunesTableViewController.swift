
import UIKit

class ITunesTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var sortList: UIPickerView! // sort bar

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    var pickerData: [String] = ["Recent", "Popular"] //type to sort

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
     self.sortList.delegate = self
         self.sortList.dataSource = self
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfITunes.count
    }

 override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
 }

 // Number of columns of data
 func numberOfComponents(in pickerView: UIPickerView) -> Int {
     return 1
 }
 
 // The number of rows of data
 func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     return pickerData.count
 }
 
 // The data to return fopr the row and component (column) that's being passed in
 func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return pickerData[row]
 }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let app = listOfITunes[indexPath.row]
        cell.textLabel?.text = app.artistName
        cell.detailTextLabel?.text = app.trackCensoredName
        cell.imageView?.image = UIImage.init(url: app.artworkUrl100)
   
        return cell
    }
}

// put the search bar delegate in an extension
extension ITunesTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // when search button is clicked
        
        guard let searchBarText = searchBar.text
            else {return}
        let iTunesRequest = ITunesRequest(name: searchBarText, intList: sortList.selectedRow(inComponent: 0)) // add sort
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

extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }

        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
