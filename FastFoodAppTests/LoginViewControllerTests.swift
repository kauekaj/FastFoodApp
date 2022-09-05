//
//  LoginViewControllerTests.swift
//  FastFoodAppTests
//
//  Created by Kaue de Assis Jacyntho on 02/09/22.
//

import Foundation
import XCTest
@testable import FastFoodApp

final class LoginViewTestCase: XCTestCase {

    var sut: LoginView!
    
    override func setUp() {
        super.setUp()
        sut = LoginView()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testLoginButtonEnabled() {
        sut.didTapLoginButton()
        
        XCTAssertEqual(sut.emailTextField.text != nil, sut.passwordTextField.text != nil)
        
        
    }

}
