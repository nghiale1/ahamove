//
//  Repository.swift
//  ahamove
//
//  Created by Nghia on 21/09/2024.
//
import Foundation

// MARK: - Repository
struct Organization: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let url, reposURL, eventsURL, hooksURL: String
    let issuesURL: String
    let membersURL, publicMembersURL: String
    let avatarURL: String
    let description, name: String
    let company: JSONNull?
    let blog: String
    let location, email, twitterUsername: String
    let isVerified, hasOrganizationProjects, hasRepositoryProjects: Bool
    let publicRepos, publicGists, followers, following: Int
    let htmlURL: String
    var createdAt, updatedAt: Date?
    let archivedAt: JSONNull?
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case url
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case hooksURL = "hooks_url"
        case issuesURL = "issues_url"
        case membersURL = "members_url"
        case publicMembersURL = "public_members_url"
        case avatarURL = "avatar_url"
        case description, name, company, blog, location, email
        case twitterUsername = "twitter_username"
        case isVerified = "is_verified"
        case hasOrganizationProjects = "has_organization_projects"
        case hasRepositoryProjects = "has_repository_projects"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case htmlURL = "html_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case archivedAt = "archived_at"
        case type
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.id = try container.decode(Int.self, forKey: .id)
        self.nodeID = try container.decode(String.self, forKey: .nodeID)
        self.url = try container.decode(String.self, forKey: .url)
        self.reposURL = try container.decode(String.self, forKey: .reposURL)
        self.eventsURL = try container.decode(String.self, forKey: .eventsURL)
        self.hooksURL = try container.decode(String.self, forKey: .hooksURL)
        self.issuesURL = try container.decode(String.self, forKey: .issuesURL)
        self.membersURL = try container.decode(String.self, forKey: .membersURL)
        self.publicMembersURL = try container.decode(String.self, forKey: .publicMembersURL)
        self.avatarURL = try container.decode(String.self, forKey: .avatarURL)
        self.description = try container.decode(String.self, forKey: .description)
        self.name = try container.decode(String.self, forKey: .name)
        self.company = try container.decodeIfPresent(JSONNull.self, forKey: .company)
        self.blog = try container.decode(String.self, forKey: .blog)
        self.location = try container.decode(String.self, forKey: .location)
        self.email = try container.decode(String.self, forKey: .email)
        self.twitterUsername = try container.decode(String.self, forKey: .twitterUsername)
        self.isVerified = try container.decode(Bool.self, forKey: .isVerified)
        self.hasOrganizationProjects = try container.decode(Bool.self, forKey: .hasOrganizationProjects)
        self.hasRepositoryProjects = try container.decode(Bool.self, forKey: .hasRepositoryProjects)
        self.publicRepos = try container.decode(Int.self, forKey: .publicRepos)
        self.publicGists = try container.decode(Int.self, forKey: .publicGists)
        self.followers = try container.decode(Int.self, forKey: .followers)
        self.following = try container.decode(Int.self, forKey: .following)
        self.htmlURL = try container.decode(String.self, forKey: .htmlURL)
//        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        let dateFormatter = ISO8601DateFormatter()
        let createdAtString = try container.decode(String.self, forKey: .createdAt)
                self.createdAt = dateFormatter.date(from: createdAtString)
        let updatedAtString = try container.decode(String.self, forKey: .updatedAt)
                self.updatedAt = dateFormatter.date(from: updatedAtString)
        self.archivedAt = try container.decodeIfPresent(JSONNull.self, forKey: .archivedAt)
        self.type = try container.decode(String.self, forKey: .type)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
            hasher.combine(0)
        }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
extension Date{
    
    public static func iso8601StringDate(_ stringDate: String) -> Date? {
        let formatter = DateFormatter.iso8601DateFormatterWithFractionalSecondsCurrent
        return formatter.date(from: stringDate)
    }
}
extension DateFormatter {
    static let iso8601DateFormatterWithFractionalSecondsCurrent: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = .iso8601CalendarCurrent
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.timeZone = .current
        formatter.locale = .current
        return formatter
    }()
}
extension TimeZone {
    /// Utility UTC ("Coordinated Universal Time") TimeZone instance.
    public static var utc: TimeZone {
        TimeZone(abbreviation: "UTC")!
    }
}
extension Calendar {
    static let iso8601CalendarUTC: Calendar = {
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = .utc
        return calendar
    }()
    
    static let iso8601CalendarCurrent: Calendar = {
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = .current
        return calendar
    }()
    
}
