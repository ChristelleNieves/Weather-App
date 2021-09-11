//
//  HourlyWeatherCell.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/10/21.
//

import UIKit

class HourlyWeatherCell: UITableViewCell {
    
    var weatherData: [CurrentData]?
    var collectionView: UICollectionView?
    var imageCache = [UIImage]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup

extension HourlyWeatherCell {
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.allowsSelection = false
        collectionView?.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: "HourlyCell")
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.showsHorizontalScrollIndicator = false
        
        contentView.addSubview(collectionView!)
        
        // Constraints
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - CollectionView Delegate

extension HourlyWeatherCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCell", for: indexPath) as! HourlyCollectionViewCell
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.backgroundColor = UIColor.systemOrange.withAlphaComponent(0.35)
        
        guard let data = weatherData else { return cell }
        
        let time = Date(timeIntervalSince1970: data[indexPath.row].dt)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.timeZone = .current
        let localTime = dateFormatter.string(from: time)
        let shortenedTime = localTime.split(separator: ":")
        let amPm = shortenedTime[1].split(separator: " ")
        let finalTime = "\(shortenedTime[0]) \(amPm[1])"
        
        if imageCache.count == data.count {
            cell.setupCellWithWeatherData(data: data[indexPath.row], time: finalTime, image: imageCache[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: contentView.frame.height - 10)
    }
}

//  MARK: - Auxiliary Functions

extension HourlyWeatherCell {
    func setupCellWithWeatherData(data: [CurrentData], images: [UIImage]) {
        weatherData = data
        imageCache = images
        collectionView?.reloadData()
    }
}
