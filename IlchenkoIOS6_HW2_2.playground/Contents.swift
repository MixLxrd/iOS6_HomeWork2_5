class Track {
    var nameTrack: String
    var nameArtist: String
    var durationTrack: String
    var country: String
    
    init(nameTrack: String, nameArtist: String, durationTrack: String, country: String) {
        self.nameTrack = nameTrack
        self.nameArtist = nameArtist
        self.durationTrack = durationTrack
        self.country = country
    }
}

class Category {
    var nameCategory: String
    lazy var tracks: [Track] = []
    var countOfList: Int { return tracks.count }
    
    
    func addTrack(track: Track) {
        tracks.append(track)
    }
    
    func delTrack(track: Track) {
        
        var i = 0
        for element in tracks {
            if element.nameTrack == track.nameTrack {
                tracks.remove(at: i)
            }
            i += 1
        }
    }
    
    init(nameCategory: String) {
        self.nameCategory = nameCategory
    }
}

class ListOfCategory {
    var categorys: [Category] = []
    var countOfCategory: String { return "Всего \(categorys.count) жанров" }
    
    func addCategory(category: Category) {
        categorys.append(category)
    }
    
    func delCategory(category: Category) {
        var i = 0
        for element in categorys {
            if element.nameCategory == category.nameCategory {
                categorys.remove(at: i)
            }
            i += 1
        }
    }
}


var numb = Track(nameTrack: "Numb", nameArtist: "Linkin Park", durationTrack: "3:30", country: "USA")

var rock = Category(nameCategory: "Rock")
rock.addTrack(track: numb)

var heavyMetal = Category(nameCategory: "Heavy Metal")

var genres = ListOfCategory()

genres.addCategory(category: rock)
genres.addCategory(category: heavyMetal)

print(genres.countOfCategory)


heavyMetal.addTrack(track: Track(nameTrack: "Highway To Hell", nameArtist: "AC/DC", durationTrack: "4:45", country: "USA"))
print(heavyMetal.countOfList)
print(heavyMetal.tracks[0].nameTrack)


print(rock.countOfList)
rock.addTrack(track: heavyMetal.tracks[0])
print(rock.countOfList)


func copyTrack(oldCategory: Category, newCategory: Category, track: Track) {
    var i = 0
    for element in oldCategory.tracks {
        if track.nameTrack == element.nameTrack {
            newCategory.addTrack(track: oldCategory.tracks[i])
        }
        i += 1
    }
}

copyTrack(oldCategory: rock, newCategory: heavyMetal, track: numb)

for element in heavyMetal.tracks {
    print(element.nameTrack)
}
