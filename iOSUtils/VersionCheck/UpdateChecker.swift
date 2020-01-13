//
//  UpdateChecker.swift
//  iOSUtils
//
//  Created by Daniel Martinez on 11/12/2019.
//  Copyright © 2019 com.dm. All rights reserved.
//

import Foundation

public class UpdateChecker {
  
  public enum VersionError: Error {
      case invalidResponse, invalidBundleInfo
  }
  
  public init() {
    
  }
  
  public func isUpdateAvailable(completion: @escaping (Bool?, Error?) -> Void) -> URLSessionDataTask? {
      guard let info = Bundle.main.infoDictionary,
          let currentVersion = info["CFBundleShortVersionString"] as? String,
          let identifier = info["CFBundleIdentifier"] as? String,
          let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)") else {
              completion(nil, VersionError.invalidBundleInfo)
            return nil
      }
    
      let urlconfig = URLSessionConfiguration.default
      urlconfig.timeoutIntervalForRequest = 4
      urlconfig.timeoutIntervalForResource = 4
    
      let session = URLSession(configuration: urlconfig)
    
      let task = session.dataTask(with: url) { (data, response, error) in
          do {
              if let error = error { throw error }
              guard let data = data else { throw VersionError.invalidResponse }
              let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any]
              guard let result = (json?["results"] as? [Any])?.first as? [String: Any], let version = result["version"] as? String else {
                  throw VersionError.invalidResponse
              }
              completion(version != currentVersion, nil)
          } catch {
              completion(nil, error)
          }
      }
      task.resume()
      return task
  }
  
}
