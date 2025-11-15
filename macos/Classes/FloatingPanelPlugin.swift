import Cocoa
import FlutterMacOS

public class FloatingPanelPlugin: NSObject, FlutterPlugin {
  private var floatingPanel: FloatingPanel?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "macos_floating_panel", binaryMessenger: registrar.messenger)
    let instance = FloatingPanelPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "show":
      showPanel(arguments: call.arguments, result: result)
    case "hide":
      hidePanel(result: result)
    case "isVisible":
      result(floatingPanel?.isVisible ?? false)
    case "setSize":
      setSize(arguments: call.arguments, result: result)
    case "setPosition":
      setPosition(arguments: call.arguments, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func showPanel(arguments: Any?, result: @escaping FlutterResult) {
    // Default size
    var size = NSSize(width: 300, height: 400)

    // Parse arguments for custom size and position if provided
    if let args = arguments as? [String: Any] {
      if let width = args["width"] as? Double, let height = args["height"] as? Double {
        size = NSSize(width: width, height: height)
      }
    }

    // Create panel if it doesn't exist
    if floatingPanel == nil {
      floatingPanel = FloatingPanel(size: size)
    } else {
      floatingPanel?.updateSize(size)
    }

    // Update position if provided
    if let args = arguments as? [String: Any] {
      if let x = args["x"] as? Double, let y = args["y"] as? Double {
        floatingPanel?.updatePosition(NSPoint(x: x, y: y))
      }
    }

    floatingPanel?.makeKeyAndOrderFront(nil)
    result(true)
  }

  private func hidePanel(result: @escaping FlutterResult) {
    floatingPanel?.orderOut(nil)
    result(true)
  }

  private func setSize(arguments: Any?, result: @escaping FlutterResult) {
    guard let args = arguments as? [String: Any],
          let width = args["width"] as? Double,
          let height = args["height"] as? Double else {
      result(FlutterError(code: "INVALID_ARGUMENTS", message: "Width and height required", details: nil))
      return
    }

    floatingPanel?.updateSize(NSSize(width: width, height: height))
    result(true)
  }

  private func setPosition(arguments: Any?, result: @escaping FlutterResult) {
    guard let args = arguments as? [String: Any],
          let x = args["x"] as? Double,
          let y = args["y"] as? Double else {
      result(FlutterError(code: "INVALID_ARGUMENTS", message: "X and Y coordinates required", details: nil))
      return
    }

    floatingPanel?.updatePosition(NSPoint(x: x, y: y))
    result(true)
  }
}
