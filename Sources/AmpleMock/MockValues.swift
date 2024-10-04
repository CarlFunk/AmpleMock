//
//  MockValues.swift
//  AmpleMock
//
//  Created by Carl Funk on 10/3/24.
//  Copyright © 2024 Carl Funk. All rights reserved.
//

public struct MockValues<Model> {
    public let values: [PartialKeyPath<Model>: Any]
    
    public init(_ values: [PartialKeyPath<Model>: Any] = [:]) {
        self.values = values
    }
    
    public static func include<ValueType>(_ keyPath: KeyPath<Model, ValueType>, value: ValueType) -> MockValues<Model> {
        var newValues = [PartialKeyPath<Model>: Any]()
        newValues[keyPath] = value
        return MockValues<Model>(newValues)
    }
    
    public func include<ValueType>(_ keyPath: KeyPath<Model, ValueType>, value: ValueType) -> MockValues<Model> {
        var newValues = values
        newValues[keyPath] = value
        return MockValues<Model>(newValues)
    }
    
    public func get<ValueType>(_ keyPath: KeyPath<Model, ValueType>, defaultValue: ValueType) -> ValueType {
        values[keyPath] as? ValueType ?? defaultValue
    }
}
