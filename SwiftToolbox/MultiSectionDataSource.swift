//
//  MultiSectionDataSource.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 16/04/2017.
//  Copyright © 2017 bendavisapps. All rights reserved.
//

import Foundation

public class MultiSectionDataSource: NSObject, UICollectionViewDataSource {
    
    public let sections: [UICollectionViewDataSource]
    
    public init(sections: [UICollectionViewDataSource]) {
        self.sections = sections
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].collectionView(collectionView, numberOfItemsInSection: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let updatedIndexPath = IndexPath(item: indexPath.item, section: 0)
        return sections[indexPath.section].collectionView(collectionView, cellForItemAt: updatedIndexPath)
    }
    
}
