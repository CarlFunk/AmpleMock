//
//  MockableTests.swift
//  AmpleMockTests
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation
import Testing

struct MockableTests {

    @Test func defaultMock() async throws {
        let mock = Widget.mock()
        
        #expect(mock.name == "Basic Widget")
        #expect(mock.dimensions.length.value == 3)
        #expect(mock.dimensions.width.value == 2)
        #expect(mock.dimensions.depth.value == 1)
        #expect(mock.price == 23.99)
        #expect(mock.isAvailable == true)
    }
    
    @Test func mockWithValues() async throws {
        let mock = Widget.mock(
            values: .include(\.name, value: "Pro Widget"))
        
        #expect(mock.name == "Pro Widget")
        #expect(mock.dimensions.length.value == 3)
        #expect(mock.dimensions.width.value == 2)
        #expect(mock.dimensions.depth.value == 1)
        #expect(mock.price == 23.99)
        #expect(mock.isAvailable == true)
    }
    
    @Test func nestedMockWithValues() async throws {
        let nestedMock = WidgetDimensions.mock(
            values: .include(\.depth, value: Measurement<UnitLength>(value: 3, unit: .feet)))
        
        let mock = Widget.mock(
            values: .include(\.dimensions, value: nestedMock))
        
        #expect(mock.name == "Basic Widget")
        #expect(mock.dimensions.length.value == 3)
        #expect(mock.dimensions.width.value == 2)
        #expect(mock.dimensions.depth.value == 3)
        #expect(mock.price == 23.99)
        #expect(mock.isAvailable == true)
    }
    
    @Test(.disabled("Unsupported direct setting of nested models, implementing in the near future")) func nestedMockDirectAccessWithValues() async throws {
        let mock = Widget.mock(
            values: .include(\.dimensions.length, value: Measurement<UnitLength>(value: 3, unit: .feet)))
        
        #expect(mock.name == "Basic Widget")
        #expect(mock.dimensions.length.value == 3)
        #expect(mock.dimensions.width.value == 2)
        #expect(mock.dimensions.depth.value == 3)
        #expect(mock.price == 23.99)
        #expect(mock.isAvailable == true)
    }

}
