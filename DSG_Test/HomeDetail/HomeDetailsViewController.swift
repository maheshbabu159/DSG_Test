//
//  HomeDetailsViewController.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import UIKit

class HomeDetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventAddressLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    var searhEvent: Events?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        self.titleLabel.text = searhEvent?.title
        self.eventAddressLabel.text = searhEvent?.venue?.address
        if let eventDate = searhEvent?.datetime_local {
            self.eventDateLabel.text = Date().convertDateFormater(eventDate)
        } else {
            self.eventDateLabel.text = "N/A"
        }
        if searhEvent?.performers?.count ?? 0 > 0 {
            guard let imageUrl = searhEvent?.performers?[0].image else { return }
            eventImage.loadImageFromServerURL(imageUrl, placeHolder: UIImage())
        }
        self.updateFavouriteImage()
        // Do any additional setup after loading the view.
    }
    func updateFavouriteImage() {
        if let favId = searhEvent?.id {
            if CoreDataManager.shared.favouriteIdExists(id: favId) {
                self.favouriteButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            } else {
                self.favouriteButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
            }
        }
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        let favIds = CoreDataManager.shared.fetchFavourites()
        print(favIds)
        if let favId = searhEvent?.id {
            if CoreDataManager.shared.favouriteIdExists(id: favId) {
                CoreDataManager.shared.deleteFavourite(fav_id: favId)
                self.favouriteButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
            } else {
                CoreDataManager.shared.saveFavourite(fav_id: favId)
                self.favouriteButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            }
        }
    }
    
}
