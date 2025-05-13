//
//  WidgetDimensions.swift
//  AmpleMockTests
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

struct WidgetDimensions: Mockable {
    let length: Measurement<UnitLength>
    let width: Measurement<UnitLength>
    let depth: Measurement<UnitLength>
    
    static func mock(values: AmpleMock.MockValues<WidgetDimensions>) -> WidgetDimensions {
        WidgetDimensions(
            length: values.get(\.length, defaultValue: Measurement(value: 3, unit: .feet)),
            width: values.get(\.width, defaultValue: Measurement(value: 2, unit: .feet)),
            depth: values.get(\.depth, defaultValue: Measurement(value: 1, unit: .feet)))
    }
}
