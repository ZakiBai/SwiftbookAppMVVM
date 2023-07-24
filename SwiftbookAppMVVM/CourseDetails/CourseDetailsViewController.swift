//
//  CourseDetailsViewController.swift
//  SwiftbookAppMVVM
//
//  Created by Zaki on 24.07.2023.
//

import UIKit

class CourseDetailsViewController: UIViewController {

    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessonsLabel: UILabel!
    @IBOutlet var numberOfTestsLabel: UILabel!
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    
    var viewModel: CourseDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func favoriteToggle(_ sender: Any) {
        viewModel.favButtonPressed()
    }
    
    private func setupUI() {
        setStatusForFavoriteButton(viewModel.isFavorite)
        
        viewModel.viewModelDidChange = { [unowned self] viewModel in
            setStatusForFavoriteButton(viewModel.isFavorite)
        }
        
        courseNameLabel.text = viewModel.courseName
        numberOfTestsLabel.text = viewModel.numberOfTests
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        courseImage.image = UIImage(data: viewModel.imageData ?? Data())
    }
    
    private func setStatusForFavoriteButton(_ status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
