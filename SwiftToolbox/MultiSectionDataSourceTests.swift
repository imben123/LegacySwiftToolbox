//
//  MultiSectionDataSourceTests.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 16/04/2017.
//  Copyright © 2017 bendavisapps. All rights reserved.
//

import XCTest
@testable import SwiftToolbox

class MultiSectionDataSourceTests: XCTestCase {
    
    var sut: MultiSectionDataSource!
    
    class ExampleDataSource: NSObject, UICollectionViewDataSource {
        
        let numberOfItems = Int(arc4random_uniform(1000) + 1)
        let cell = UICollectionViewCell()
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return numberOfItems
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            return cell
        }
        
    }
    
    let exampleSections = [ExampleDataSource(), ExampleDataSource()]
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func setUp() {
        super.setUp()
        sut = MultiSectionDataSource(sections: exampleSections)
    }
    
    func testIsACollectionViewDataSource() {
        let _ = sut as UICollectionViewDataSource
    }
    
    func testNumberOfSections_equalToNumberOfComponentSections() {
        XCTAssertEqual(sut.numberOfSections(in: collectionView), exampleSections.count)
    }
    
    func testNumberOfRowsIsTakenFromSection() {
        
        XCTAssertEqual(sut.collectionView(collectionView, numberOfItemsInSection: 0),
                       exampleSections[0].collectionView(collectionView, numberOfItemsInSection: 0))
        
        XCTAssertEqual(sut.collectionView(collectionView, numberOfItemsInSection: 1),
                       exampleSections[1].collectionView(collectionView, numberOfItemsInSection: 0))
    }
    
    func testCellsArePassedFromSection() {
        
        let indexPathSection0 = IndexPath(item: 0, section: 0)
        let indexPathSection1 = IndexPath(item: 0, section: 1)
        
        XCTAssert(sut.collectionView(collectionView, cellForItemAt: indexPathSection0) ===
            exampleSections[0].collectionView(collectionView, cellForItemAt: indexPathSection0))
        
        XCTAssert(sut.collectionView(collectionView, cellForItemAt: indexPathSection1) ===
            exampleSections[1].collectionView(collectionView, cellForItemAt: indexPathSection0))
    }
    
}
