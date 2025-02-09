//
//  Semver.swift
//
//
//  Created by MochiTeam on 10/4/23.
//
//

struct Semver: PackageDependency {
    var dependency: Package.Dependency {
        .package(url: "https://github.com/ddddxxx/Semver", from: "0.2.0")
    }
}
