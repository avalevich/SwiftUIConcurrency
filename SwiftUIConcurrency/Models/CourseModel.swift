import Foundation

typealias CourseData = SwiftUIConcurrency.CourseQuery.Data.CourseCollection

struct CoursesCollection: Decodable {
    let courses: [Course]
    init(_ coursesCollection: CourseData?) {
        self.courses = coursesCollection?.courses.map({ course -> Course in
            Course(course)
        }) ?? []
    }
}

struct Course: Identifiable, Decodable {
    let id: String
    let publishedAt: String
    let title: String
    let subtitle: String
    let numberOfSections: Int
    let numberOfHours: Int
    let subject: String
    let colors: [String?]
    let illustration: String
    let sectionCollection: SectionCollection?
    
    init(_ course: CourseData.Course?) {
        self.id = course?.sys.id ?? ""
        self.publishedAt = course?.sys.publishedAt ?? ""
        self.title = course?.title ?? ""
        self.subtitle = course?.subtitle ?? ""
        self.numberOfSections = course?.numberOfSections ?? 0
        self.numberOfHours = course?.numberOfHours ?? 0
        self.subject = course?.subject ?? ""
        self.colors = course?.colors ?? ["#0279FF", "#4FA3FF"]
        self.illustration = course?.illustration?.url ?? ""
        self.sectionCollection = SectionCollection(course?.sectionCollection)
    }
}

struct SectionCollection: Decodable {
    struct Section: Identifiable, Decodable {
        let id: String
        let title: String
        let subtitle: String
        let content: String
        
        init(_ section: CourseData.Course.SectionCollection.Section?) {
            self.id = section?.sys.id ?? ""
            self.title = section?.title ?? ""
            self.subtitle = section?.subtitle ?? ""
            self.content = section?.content ?? ""
        }
    }
    let sections: [Section]
    
    init(_ sectionCollection: CourseData.Course.SectionCollection?) {
        self.sections = sectionCollection?.sections.map({ section in
            Section(section)
        }) ?? []
    }
}


