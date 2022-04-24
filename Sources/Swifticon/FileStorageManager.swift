//
//  FileStorageManager.swift
//  
//
//  Created by Terje Lønøy on 21/04/2022.
//

import UIKit

class FileStorageManager {
    static func saveImage(_ image: UIImage, atPath path: URL, filename: String) throws {
        if !FileManager.default.fileExists(atPath: path.path) {
            try FileManager.default.createDirectory(atPath: path.path, withIntermediateDirectories: true, attributes: nil)
        }
        
        var fileUrl = path.appendingPathComponent(filename)
        fileUrl.appendPathExtension("png")
        let data = image.pngData()
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            try FileManager.default.removeItem(atPath: fileUrl.path)
        }
        
        try data?.write(to: fileUrl)
    }
    
    static func createIconSetDirectoryIfNonexistent(atPath path: URL, named: String) throws -> URL {
        var path = path.appendingPathComponent(named)
        path.appendPathExtension("appiconset")
        
        if !FileManager.default.fileExists(atPath: path.path) {
            try FileManager.default.removeItem(atPath: path.path)
        }
        
        try FileManager.default.createDirectory(atPath: path.path, withIntermediateDirectories: true, attributes: nil)
        
        return path
    }
    
    static func getAssetsDirectory(named assetsDirectoryName: String, atPath path: String) -> URL? {
        let assetsDirectoryWithSuffix = "\(assetsDirectoryName.replacingOccurrences(of: " ", with: "%20")).xcassets"
        var url = URL(string: path)!
        var assetsDirectoryPath: URL?
        
        // Prevent searching outside of the projects directory scope
        var foundXcodeProject = false
        
        // Bubble upwards from current directory and search recursively all folders for the
        // assets directory until the assets directory is found, and/or the xcode project is found.
        while assetsDirectoryPath == nil && !foundXcodeProject {
            var files = [URL]()
            if let enumerator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles, .skipsPackageDescendants]) {
                for case let fileURL as URL in enumerator {
                    do {
                        let fileAttributes = try fileURL.resourceValues(forKeys:[.isRegularFileKey])
                        if fileAttributes.isRegularFile! {
                            files.append(fileURL)
                        }
                    } catch { print(error, fileURL) }
                }
                
                foundXcodeProject = files.first { $0.absoluteString.contains(".xcodeproj") } != nil
                assetsDirectoryPath = files.first { $0.absoluteString.contains(assetsDirectoryWithSuffix) }
                url = url.deletingLastPathComponent()
            }
        }
        
        // assetsDirectoryPath is yielded with full path to files inside it, so strip
        // path components until we are at the actual directory
        if assetsDirectoryPath != nil {
            while !assetsDirectoryPath!.lastPathComponent.contains(".xcassets") {
                assetsDirectoryPath = assetsDirectoryPath?.deletingLastPathComponent()
            }
        }
        
        return assetsDirectoryPath
    }
    
    static func saveContentFile(content: Data, atPath path: URL) throws {
        let contentJson = String(data: content, encoding: .utf8)
        let path = path.appendingPathComponent("Contents.json")
        
        if !FileManager.default.fileExists(atPath: path.path) {
            try FileManager.default.removeItem(atPath: path.path)
        }
        
        try contentJson!.write(to: path, atomically: true, encoding: .utf8)
    }
}
