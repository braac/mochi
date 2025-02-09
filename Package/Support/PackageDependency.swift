//
// PackageDependency.swift
// Copyright (c) 2023 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

// MARK: - PackageDependency

protocol PackageDependency: Dependency {
    init()

    var packageName: String { get }
    var dependency: _PackageDescription_PackageDependency { get }
}

extension PackageDependency {
    var productName: String {
        "\(Self.self)"
    }

    var packageName: String {
        switch dependency.kind {
        case let .sourceControl(name: name, location: location, requirement: _):
            let packageName = name ?? location.packageName ?? productName // Use productName as the fallback
            print("DEBUG: PackageDependency.packageName - sourceControl: \(packageName)") // Debug print
            return packageName
        case let .fileSystem(name: name, path: path):
            let packageName = name ?? path.packageName ?? productName
            print("DEBUG: PackageDependency.packageName - fileSystem: \(packageName)")  // Debug print
            return packageName
        case let .registry(id: id, requirement: _):
            print("DEBUG: PackageDependency.packageName - registry: \(id)") // Debug print
            return id
        @unknown default:
            print("DEBUG: PackageDependency.packageName - unknown: \(productName)") // Debug print
            return productName
        }
    }

    var targetDepenency: _PackageDescription_TargetDependency {
        switch dependency.kind {
        case let .sourceControl(name: name, location: location, requirement: _):
            let packageName = name ?? location.packageName ?? productName  // Use productName
            print("DEBUG: PackageDependency.targetDepenency - sourceControl: \(packageName)") // Debug print
            return .product(name: productName, package: packageName)

        default:
             print("DEBUG: PackageDependency.targetDepenency - default: \(productName)") // Debug print
            return .byName(name: productName)
        }
    }
}
