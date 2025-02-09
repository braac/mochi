//
//  Semver.swift
//
//
//  Created by MochiTeam on 10/4/23.
//
//

struct Semver: PackageDependency {
    var dependency: Package.Dependency {
        .package(url: "https://github.com/sersoft-gmbh/semver", from: "5.0.0")
    }
}
