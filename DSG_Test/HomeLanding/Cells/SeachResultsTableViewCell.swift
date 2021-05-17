//
//  SeachResultsTableViewCell.swift
//  DSG_Test
//
//  Created by Mahesh Somineni on 15/05/21.
//

import UIKit

class SeachResultsTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchTitleLabel: UILabel!
    @IBOutlet weak var searchAddressLabel: UILabel!
    @IBOutlet weak var searchDateLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    var searhEvent: Events? {
        didSet {
            loadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgroundView.layer.applyCornerRadiusShadow(color: .black,
                                    alpha: 0.28,
                                    x: 0, y: 3,
                                    blur: 5,
                                    spread: 0,
                                    cornerRadiusValue: 8)
        searchImageView.layer.cornerRadius = 8
        searchImageView.layer.masksToBounds = true
    }
    private func loadData() {
        self.searchTitleLabel.text = searhEvent?.title
        self.searchAddressLabel.text = searhEvent?.venue?.address
        if let eventDate = searhEvent?.datetime_local {
            self.searchDateLabel.text = Date().convertDateFormater(eventDate)
        } else {
            self.searchDateLabel.text = "N/A"
        }
        if searhEvent?.performers?.count ?? 0 > 0 {
            guard let imageUrl = searhEvent?.performers?[0].image else { return }
            searchImageView.loadImageFromServerURL(imageUrl, placeHolder: UIImage())
        }
        self.updateFavouriteImage()
    }
    func updateFavouriteImage() {
        if let favId = searhEvent?.id {
            if CoreDataManager.shared.favouriteIdExists(id: favId) {
                self.favouriteButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            } else {
                self.favouriteButton.setImage(UIImage(), for: .normal)
            }
        }
    }
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        if let favId = searhEvent?.id {
            if CoreDataManager.shared.favouriteIdExists(id: favId) {
                CoreDataManager.shared.deleteFavourite(fav_id: favId)
                self.favouriteButton.setImage(UIImage(), for: .normal)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

