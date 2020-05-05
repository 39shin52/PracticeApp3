//
//  Todo.swift
//  TodoRealm
//
//  Created by Itou Shingo on 2020/05/04.
//  Copyright © 2020 Itou Shingo. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var title = ""
}
