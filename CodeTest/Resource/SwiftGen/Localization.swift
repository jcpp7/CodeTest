// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen
// Derived from https://github.com/SwiftGen/SwiftGen/issues/685#issuecomment-782893242
// Origin see https://github.com/SwiftGen/SwiftGen/blob/stable/templates/strings/structured-swift5.stencil
//
// Example:
//
//  var body: some View {
//    VStack {
//      Text(L10n.Login.PageTitle.header.key) // return LocalizedStringKey
//      CustomView(string: L10n.Login.Step1.title.text) // return String
//    }
//  }

import SwiftUI

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// My TV Shows
  public static let bookstoreTitle = LocalizedString(table: "Localizable", lookupKey: "bookstore_title")
  /// Loading...
  public static let loaderLoading = LocalizedString(table: "Localizable", lookupKey: "loader_loading")
  /// Grid view
  public static let menuGridAccesibilityLabel = LocalizedString(table: "Localizable", lookupKey: "menu_grid_accesibility_label")
  /// List view
  public static let menuListAccesibilityLabel = LocalizedString(table: "Localizable", lookupKey: "menu_list_accesibility_label")
  /// Ok
  public static let showErrorLoadingButton = LocalizedString(table: "Localizable", lookupKey: "show_error_loading_button")
  /// We are sorry. Something wrong happened. Pease, try again in a few minutes.
  public static let showErrorLoadingMessage = LocalizedString(table: "Localizable", lookupKey: "show_error_loading_message")
  /// Error
  public static let showErrorLoadingTitle = LocalizedString(table: "Localizable", lookupKey: "show_error_loading_title")
  /// We are sorry. Something wrong happened. Pease, try again.
  public static let showsErrorLoadingMessage = LocalizedString(table: "Localizable", lookupKey: "shows_error_loading_message")
  /// Retry
  public static let showsErrorLoadingRetryButton = LocalizedString(table: "Localizable", lookupKey: "shows_error_loading_retry_button")
  /// Error
  public static let showsErrorLoadingTitle = LocalizedString(table: "Localizable", lookupKey: "shows_error_loading_title")
}

// MARK: - Implementation Details
fileprivate func tr(_ table: String, _ key: String, _ locale: Locale = Locale.current, _ args: CVarArg...) -> String {
  let path = Bundle.main.path(forResource: locale.identifier, ofType: "lproj") ?? ""
  let format: String
  if let bundle = Bundle(path: path) {
    format = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
  } else {
    format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
  }
  return String(format: format, locale: locale, arguments: args)
}

public struct LocalizedString: Hashable {
  let table: String
  fileprivate let lookupKey: String

  init(table: String, lookupKey: String) {
    self.table = table
    self.lookupKey = lookupKey
  }

  var key: LocalizedStringKey {
    LocalizedStringKey(lookupKey)
  }

  var text: String {
    tr(table, lookupKey)
  }

  func text(withLocale locale: Locale) -> String {
    tr(table, lookupKey, locale)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
      return Bundle.module
    #else
      return Bundle(for: BundleToken.self)
    #endif
  }()
}
