//
//  TestView.swift
//  MVVM + Delegat
//
//  Created by Виктор Басиев on 16.09.2022.
//

import UIKit

class TestView: UIView {
    
    var viewData: ViewData? = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = .gray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupHeirarhy()
        setupLayout()
        
        switch viewData {
        case .initial:
            startStopActivityIndicator(viewData: nil)
        case .loading:
            startStopActivityIndicator(viewData: .loading)
            update(isHidden: true)
        case .success:
            startStopActivityIndicator(viewData: .success)
            update(isHidden: false)
        case .failure:
            update(isHidden: false)
            startStopActivityIndicator(viewData: .failure)
        default:
            break
        }
    }
    
    private func setupHeirarhy() {
        addSubview(activityIndicator)
        addSubview(imageView)
        addSubview(titleLable)
        addSubview(descriptionLabel)
        addSubview(startButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLable.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLable.bottomAnchor, multiplier: 1),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            startButton.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 1),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    private func update(isHidden: Bool) {
        imageView.isHidden = isHidden
        titleLable.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
    }
    
    private func startStopActivityIndicator(viewData: ViewData?) {
        
        switch viewData {

        case .loading:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            startButton.isHidden = true
        default:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            startButton.isHidden = false
        }
    }
}
