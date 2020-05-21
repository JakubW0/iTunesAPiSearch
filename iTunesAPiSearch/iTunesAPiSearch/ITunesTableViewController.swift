
import UIKit

class ITunesTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

<<<<<<< HEAD
    @IBOutlet weak var sortList: UIPickerView!
=======
    @IBOutlet weak var sortList: UIPickerView! // sort bar
>>>>>>> cc8027f9c42774e5606a4d5cd927a8d3c388f2cb

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
<<<<<<< HEAD
    var pickerData: [String] = ["Recent", "Popular"]

    var appp = [App]()
=======
    var pickerData: [String] = ["Recent", "Popular"] //type to sort

>>>>>>> cc8027f9c42774e5606a4d5cd927a8d3c388f2cb
    var listOfITunes = [App]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfITunes.count) positions found"
            }
        }
    }
<<<<<<< HEAD
    let viewController = ViewController()
  
=======
>>>>>>> cc8027f9c42774e5606a4d5cd927a8d3c388f2cb
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
     self.sortList.delegate = self
         self.sortList.dataSource = self
<<<<<<< HEAD
    
    }
 

=======
>>>>>>> cc8027f9c42774e5606a4d5cd927a8d3c388f2cb
    
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
        appp = [listOfITunes[indexPath.row]]
        cell.textLabel?.text = app.artistName
        cell.detailTextLabel?.text = app.trackCensoredName
        cell.imageView?.image = UIImage.init(url: app.artworkUrl100)
   
<<<<<<< HEAD

=======
>>>>>>> cc8027f9c42774e5606a4d5cd927a8d3c388f2cb
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
               let app = listOfITunes[indexPath.row]
                controller.authorStr = app.artistName!
                controller.image = UIImage.init(url: app.artworkUrl100)
                controller.title1 = app.trackCensoredName!
                controller.granko = app.previewUrl!
                controller.album1 = app.collectionCensoredName!
                controller.date1 = app.releaseDate!
                controller.trackPrice1 = String(format: "%.2f",app.trackPrice!)
                controller.albumPrice1 = String(format: "%.2f",app.collectionPrice!)
                controller.typeMusic1 = app.primaryGenreName!
                
                
                
                
            }
        }
    }
    

}

// put the search bar delegate in an extension
extension ITunesTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // when search button is clicked
        
        guard let searchBarText = searchBar.text
            else {return}
<<<<<<< HEAD
        let iTunesRequest = ITunesRequest(name: searchBarText, intList: sortList.selectedRow(inComponent: 0))
=======
        let iTunesRequest = ITunesRequest(name: searchBarText, intList: sortList.selectedRow(inComponent: 0)) // add sort
>>>>>>> cc8027f9c42774e5606a4d5cd927a8d3c388f2cb
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

<<<<<<< HEAD

=======
>>>>>>> cc8027f9c42774e5606a4d5cd927a8d3c388f2cb
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
