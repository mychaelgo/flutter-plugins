import Flutter
import UIKit

import CoreMotion

public class SwiftPedometerPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {

    private var eventSink: FlutterEventSink?
    var pedometer = CMPedometer()

    // Register Plugin
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftPedometerPlugin()

        // Set flutter communication channel for emitting step count updates
        let eventChannel = FlutterEventChannel.init(name: "pedometer.eventChannel", binaryMessenger: registrar.messenger())
        eventChannel.setStreamHandler(instance)

        let methodChannelQuerySteps = FlutterMethodChannel(name: "pedometer.querySteps", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: methodChannelQuerySteps)
    }

     public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "querySteps":
            if let args = call.arguments as? Dictionary<String, String> {               
                if args.count == 2 {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    
                    let fromDate = dateFormatter.date(from: args["from"]!)!
                    let toDate = dateFormatter.date(from: args["to"]!)!

                    pedometer.queryPedometerData(from: fromDate, to: toDate, withHandler: {(pedometerData, error) in
                        if let data = pedometerData {
                            result(data.numberOfSteps)
                            // let _stepCount : Int = (data.numberOfSteps as! Int)
                            // result(_stepCount);
                        } else {
                            result(-2);
                        }
                    });
                } else {
                    result(-3)
                }
            } else {
                result(-5)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    // Handle query steps
    // public func querySteps(from: String, to: String) -> Int {
    //     let dateFormatter = DateFormatter()
    //     dateFormatter.dateFormat = "yyyy-MM-dd"
        
    //     let fromDate = dateFormatter.date(from: from)
    //     let toDate = dateFormatter.date(from: to)

    //     pedometer.queryPedometerData(from: fromDate, to: toDate, withHandler: {(pedometerData, error)in
    //         if let data = pedometerData{
    //             let _stepCount : Int = (data.numberOfSteps as! Int)
    //             return _stepCount
    //         } else {
    //             return -2
    //         }
    //     });
    // }

    // Handle stream emitting (Swift => Dart)
    private func sendStepCountEvent(stepCount: Int) {
        // If no eventSink to emit events to, do nothing (wait)
        if (eventSink == nil) {
            return
        }
        // Emit step count event to Flutter
        eventSink!(stepCount)
    }

    // Event Channel: On Stream Listen
    public func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = eventSink
        let now = Date()
        pedometer.startUpdates(from: now) { (pedometerData, error) in
            if let data = pedometerData {

                // Dispatch method to main thread with an async call
                DispatchQueue.main.async {
                    let _stepCount : Int = (data.numberOfSteps as! Int)
                    self.sendStepCountEvent(stepCount: _stepCount)
                }
            }
        }
        return nil
    }

    // Event Channel: On Stream Cancelled
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        NotificationCenter.default.removeObserver(self)
        eventSink = nil
        return nil
    }
}
