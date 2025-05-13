//
//  Widget.swift
//  AmpleMockTests
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

struct Widget: Mockable {
    struct Dimensions {
        let length: Measurement<UnitLength>
        let width: Measurement<UnitLength>
        let depth: Measurement<UnitLength>
    }
    
    let name: String
    let dimensions: WidgetDimensions
    let price: Double
    let isAvailable: Bool
    
    static func mock(values: AmpleMock.MockValues<Widget>) -> Widget {
        Widget(
            name: values.get(\.name, defaultValue: "Basic Widget"),
            dimensions: values.get(\.dimensions, defaultValue: .mock()),
            price: values.get(\.price, defaultValue: 23.99),
            isAvailable: values.get(\.isAvailable, defaultValue: true)
        )
    }
}
