import XCTest
import PlaygroundWrapper
import RealmSwift


class Task: Object {
    dynamic var uuid = UUID().uuidString
}


class TaskTests: XCTestCase {
    var realm: Realm!
    var task: Task!
    
    override func setUp() {
        super.setUp()
        Realm.Configuration.defaultConfiguration = Realm.Configuration(inMemoryIdentifier: UUID().uuidString)
        
        task = Task()
        realm = try! Realm()
        try! realm.write {
            realm.add([task])
        }
    }
    
    func testSetup() {
        let tasks = try! Realm().objects(Task.self)
        XCTAssertNotNil(tasks.count == 1)
    }
    
}

TaskTests.defaultTestSuite().run()
