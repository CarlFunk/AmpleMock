//
//  Mockable.swift
//  AmpleMock
//
//  Created by Carl Funk on 10/3/24.
//  Copyright © 2024 Carl Funk. All rights reserved.
//

public protocol Mockable {
    static func mock() -> Self
    static func mock(values: MockValues<Self>) -> Self
}

public extension Mockable {
    static func mock() -> Self {
        mock(values: MockValues())
    }
}
