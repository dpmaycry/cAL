
#chapter 4

#1 Optional:
		let x:String? = nil
		let x = Optional<String>.None
		let y:String? = "hello"
		let y = Optional<String>.Some("hello")
		var z = x!
		switch x {
		case Some(let value): y = x
		case None: //raise an exception
		}
#2 Array:
		var a = Array<String>()
		//equals to
		var a = [String]()

		let animals = [""]
		animals.append("")
		let animal = amimals[1]
		for animal in animals{
		print("\(animal)")
		}
#3 Dictionary:
		var pac10teamRankings = Dictionary<String, Int>()
		var pac10teamRankings = [String:Int]()
		pac10teamRankings = ["a":"1","b":"2"]
		let ranking = pac10teamRankings["a"]

		for (key,val) in pac10teamRankings{
		print("\(key)=\(value)")
		}
#4 Range:
		struct Range<T>{
		var startIndex: T
		var endIndex: T
		}

		let array = ["a","b","c","d"]
		let sub1 = array[2...3]
		let sub2 = array[2..<3]
		for i in [27...104]{}
#5 NSObject
##base class for all Objective-C classes
#6 NSNumber
		let n = NSNumber(35.5)
		let intrusion = n.intValue //also cane doubleValue,boolValue,etc

#7 NSDate
#8 NSData
#9 Data Structures in Swift
		class struct enum
Inheritance(class only)
