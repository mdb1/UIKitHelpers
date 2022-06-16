//
//  UITableView+Identifiers.swift
//
//
//  Created by Manu on 16/06/2022.
//

import Foundation
import UIKit

/// Protocol that provides a method to dequeue cells in [Table|Collection]Views.
public protocol CellDequeuing: AnyObject {
    /// Dequeues a cell of type CellType.
    /// - Parameter type: The type of the cell to be dequeued.
    /// - Parameter indexPath: The indexPath in which to dequeue the cell.
    func dequeueReusableCell<CellType: UITableViewCell>(
        _ type: CellIdentifiable.Type,
        for indexPath: IndexPath
    ) -> CellType
}

extension UITableView: CellDequeuing {
    /// Helper method for dequeuing reusable cells of type CellType that handles errors with a crash.
    /// - Parameter type: Type of the UITableViewCell to be dequeued. ie: YourCustomCell.self.
    /// - Parameter indexPath: IndexPath for the cell.
    ///
    /// Usage:
    /// ```swift
    /// tableView.dequeueReusableCell(YourCustomCell.self, for: indexPath)
    /// ```
    public func dequeueReusableCell<CellType: UITableViewCell>(
        _ type: CellIdentifiable.Type,
        for indexPath: IndexPath
    ) -> CellType {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? CellType else {
            fatalError("Couldn't dequeue cell of type: \(CellType.self). Have you registered the cell?")
        }

        return cell
    }
}

/// Protocol that provides a method to register cells in [Table|Collection]Views.
public protocol CellRegistering: AnyObject {
    /// Registers a cell that conforms to Identifiable.
    /// - Parameter type: The type of the cell to be registered.
    func register<CellType: CellIdentifiable>(_ type: CellType.Type)
}

extension UITableView: CellRegistering {
    /// Helper method for registering reusable cells of type CellType in a table view.
    /// - Parameter type: Type of the UITableViewCell to be dequeued. ie: YourCustomCell.self.
    ///
    /// Usage:
    /// ```swift
    /// tableView.register(YourCustomCell.self)
    /// ```
    public func register<CellType: CellIdentifiable>(_ type: CellType.Type) {
        register(type, forCellReuseIdentifier: CellType.reuseIdentifier)
    }
}

public protocol CellIdentifiable: AnyObject {
    /// The reuseIdentifier to use when displaying cells on [Table|Collection]Views.
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: CellIdentifiable {
    /// Static property for custom reuse identifier of UITableViewCell.
    /// It just uses the name of the class.
    /// ie: for YourCustomCell.swift: "YourCustomCell"
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
