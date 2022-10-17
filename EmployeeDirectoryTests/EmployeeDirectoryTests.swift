//
//  EmployeeDirectoryTests.swift
//  EmployeeDirectoryTests
//
//  Created by Nerella, Hanu Naga Mounika on 10/12/22.
//

import XCTest
@testable import EmployeeDirectory

class EmployeeDirectoryTests: XCTestCase {
    var viewmodel : EmployeeViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewmodel = EmployeeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmpInfo() throws {
        viewmodel.fetchEmployeeInformation()
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
