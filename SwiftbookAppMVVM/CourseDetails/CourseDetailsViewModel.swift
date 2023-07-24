//
//  CourseDetailsViewModel.swift
//  SwiftbookAppMVVM
//
//  Created by Zaki on 24.07.2023.
//

import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    var isFavorite: Bool { get }
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)? { get set }
    init(course: Course)
    func favButtonPressed()
    
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }

    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)?
    
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(for: course.name)
        } set {
            DataManager.shared.setFavoriteStatus(for: course.name, with: newValue)
            viewModelDidChange?(self)
        }
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
    
    func favButtonPressed() {
        isFavorite.toggle()
    }
    
}
