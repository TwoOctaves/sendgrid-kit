import Foundation

public struct MailSettings: Encodable {
    /// This allows you to have a blind carbon copy automatically sent to the specified email address for every email that is sent.
    public var bcc: BCC?
    
    /// Allows you to bypass all unsubscribe groups and suppressions to ensure that the email is delivered to every single recipient. This should only be used in emergencies when it is absolutely necessary that every recipient receives your email.
    public var bypassListManagement: BypassListManagement?
    
    /// The default footer that you would like included on every email.
    public var footer: Footer?
    
    /// This allows you to send a test email to ensure that your request body is valid and formatted correctly.
    public var sandboxMode: SandboxMode?
    
    /// This allows you to test the content of your email for spam.
    public var spamCheck: SpamCheck?
    
    public init(bcc: BCC? = nil,
                bypassListManagement: BypassListManagement? = nil,
                footer: Footer? = nil,
                sandboxMode: SandboxMode? = nil,
                spamCheck: SpamCheck? = nil) {
        self.bcc = bcc
        self.bypassListManagement = bypassListManagement
        self.footer = footer
        self.sandboxMode = sandboxMode
        self.spamCheck = spamCheck
    }
    
    private enum CodingKeys: String, CodingKey {
        case bcc
        case bypassListManagement = "bypass_list_management"
        case footer
        case sandboxMode = "sandbox_mode"
        case spamCheck = "spam_check"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bcc, forKey: .bcc)
        try container.encode(bypassListManagement, forKey: .bypassListManagement)
        try container.encode(footer, forKey: .footer)
        try container.encode(sandboxMode, forKey: .sandboxMode)
        try container.encode(spamCheck, forKey: .spamCheck)
    }
}

public struct BCC: Encodable {
    /// Indicates if this setting is enabled.
    public var enable: Bool?
    public var email: String?
    
    public init(enable: Bool? = nil,
                email: String? = nil) {
        self.enable = enable
        self.email = email
    }
}

public struct BypassListManagement: Encodable {
    /// Indicates if this setting is enabled.
    public var enable: Bool?
    
    public init(enable: Bool? = nil) {
        self.enable = enable
    }
}

public struct Footer: Encodable {
    /// Indicates if this setting is enabled.
    public var enable: Bool?
    
    /// The plain text content of your footer.
    public var text: String?
    
    /// The HTML content of your footer.
    public var html: String?
    
    public init(enable: Bool? = nil,
                text: String? = nil,
                html: String? = nil) {
        self.enable = enable
        self.text = text
        self.html = html
    }
}

public struct SandboxMode: Encodable {
    /// Indicates if this setting is enabled.
    public var enable: Bool?
    
    public init(enable: Bool? = nil) {
        self.enable = enable
    }
}

public struct SpamCheck: Encodable {
    /// Indicates if this setting is enabled.
    public var enable: Bool?
    
    /// The threshold used to determine if your content qualifies as spam on a scale from 1 to 10, with 10 being most strict, or most likely to be considered as spam.
    public var threshold: Int?
    
    /// An Inbound Parse URL that you would like a copy of your email along with the spam report to be sent to.
    public var postToUrl: String?
    
    public init(enable: Bool? = nil,
                threshold: Int? = nil,
                postToUrl: String? = nil) {
        self.enable = enable
        self.threshold = threshold
        self.postToUrl = postToUrl
    }
    
    private enum CodingKeys: String, CodingKey {
        case enable
        case threshold
        case postToUrl = "post_to_url"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(enable, forKey: .enable)
        try container.encode(threshold, forKey: .threshold)
        try container.encode(postToUrl, forKey: .postToUrl)
    }

}
