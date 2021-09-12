//
//  HourlyCollectionViewCell.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/10/21.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    
    var weatherData: CurrentData?
    let topLabel = UILabel()
    let imageView = UIImageView()
    let bottomLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTopLabel()
        setupImageView()
        setupBottomLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UI Setup

extension HourlyCollectionViewCell {
    private func setupTopLabel() {
        contentView.addSubview(topLabel)
        
        // Appearance
        topLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        topLabel.textColor = UIColor.white
        
        // Constraints
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            topLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFit
        
        // Constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.50),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
    
    private func setupBottomLabel() {
        contentView.addSubview(bottomLabel)
        
        // Appearance
        bottomLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        bottomLabel.textColor = UIColor.white
        
        // Constraints
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}

// MARK: - Auxiliary Functions

extension HourlyCollectionViewCell {
    func setupCellWithWeatherData(data: CurrentData, time: String, image: UIImage) {
        weatherData = data
        topLabel.text = time
        imageView.image = image
        bottomLabel.text = data.weather[0].main
    }
}
