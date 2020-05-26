//
//  ViewController.swift
//  CalendarificAPI
//
//  Created by Kuba on 20/05/2020.
//  Copyright © 2020 Cameron Partee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
      weak var delegate: ITunesTableViewController!
    var player: AVPlayer?
    var playMusic = false
    let audioContent = "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview113/v4/4f/09/47/4f094793-3502-96aa-fbda-4615c2433973/mzaf_12873528269072360339.plus.aac.p.m4a"
    @IBOutlet weak var fast: UILabel!
                     
    @IBOutlet weak var author: UILabel!
    var authorStr: String = "Example"
    var title1: String = "Example title"
    var granko: URL = URL(string: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview123/v4/d9/23/2b/d9232b10-030e-ae0a-7a69-6226b2a51604/mzaf_39153685585312776.plus.aac.p.m4a")!
    var date1: String?
    var typeMusic1: String?
    var trackPrice1: String?
    var albumPrice1: String?
    var album1: String?
    var image: UIImage? = nil
    
    @IBOutlet weak var album: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var typeMusic: UILabel!
    
    @IBOutlet weak var trackPrice: UILabel!
    
    @IBOutlet weak var AlbumPrice: UILabel!
    
    @IBOutlet weak var obrazek: UIImageView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        updatedSelectedName(newName: authorStr)
        updatedSelectedImage(newImage: image!)
        updatedSelectedTitle(newTitle: title1)
        updatedSelectedDate(newDate: date1!)
        updatedSelectedTypeMusic(newType: typeMusic1!)
        updatedSelectedAlbum(newAlbum: album1!)
        updatedSelectedAlbumPrice(newAlbumPrice: albumPrice1!)
        updatedSelectedTrackPrize(newTrackPrice: trackPrice1!)
    
        
           // Do any additional setup after loading the view.
       }

    @IBAction func piotrek(_ sender: UIButton) {
        
        downloadSound(url: granko)
    }
    
    func updatedSelectedAlbumPrice(newAlbumPrice: String?){
        AlbumPrice.text? = newAlbumPrice!+"$"
    }
    
    func updatedSelectedTrackPrize(newTrackPrice: String?){
      
        trackPrice.text? = newTrackPrice!+"$"
        
    }
    
    func updatedSelectedTypeMusic(newType: String?){

        typeMusic.text? = newType!
    }
    
    func updatedSelectedAlbum(newAlbum: String){
        album.text? = newAlbum
    }
    func updatedSelectedDate(newDate: String){

        date.text? = newDate
        
    }
 func updatedSelectedName(newName: String) {
     // do something with newName
    author.text? = newName
 }
    func updatedSelectedImage(newImage: UIImage) {

        obrazek.image? =  newImage
    }
       
    func updatedSelectedTitle(newTitle: String) {
          // do something with newName
 
        fast.text? = newTitle
      }
         
    
    func music(url: URL){
    //muzyczka nie dziala, próbowałem x sposobów juz. wez tym linkiem wyzej pierw sprawdz zanim do api podlaczysz
    }
    
    
}



