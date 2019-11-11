import Alamofire
import SwiftyJSON

public typealias ResponseHandler = (ResponseObject?) -> Void

struct HeaderKey {
    static let ContentType              = "Content-Type"
    static let Authorization            = "Authorization"
    static let Accept                   = "Accept"
}

struct HeaderValue {
    static let ApplicationJson                     = "application/json"
    static let ApplicationOctetStream              = "application/octet-stream"
    static let ApplicationXWWWFormUrlencoded       = "application/x-www-form-urlencoded"
}

public enum HttpStatusCode: Int {
    case success = 200
    case created = 201
    case accepted = 202
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case notAcceptable = 406
    case requestTimeout = 408
    case conflict = 409
    case internalServerError = 500
    case serviceUnavailable = 503
    case notConnectedToInternet = -1009
    case cancelled = -999
    case timeOut = -1001
    case cannotFindHost = -1003
    case missingLocalParmas = -9999
    case errorResponseObject = -8888

    init?(statusCode: Int?) {
        guard let _statusCode = statusCode else {
            return nil
        }
        self.init(rawValue: _statusCode)
    }
}

struct APIStatus {
    let statusCode: HttpStatusCode?
    let messageCode: String?
}

protocol ApiResponseType {
    associatedtype DataType
    var data: DataType? { get }
    var status: APIStatus { get }
}

public struct ResponseObject: ApiResponseType {
    var data: AnyObject?
    var status: APIStatus // code error, incase success
}

class NetworkManager {
    
    static let shared = NetworkManager()
    var manager: SessionManager

    init() {
        // defaultHeaders
        var defaultHeaders = SessionManager.defaultHTTPHeaders
        defaultHeaders[HeaderKey.Accept] = HeaderValue.ApplicationJson
        
        // configuration
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        configuration.timeoutIntervalForRequest = 20
        
        manager = SessionManager(configuration: configuration)
    }

    // MARK: - Functions
    private func analyzeResponse(response: DataResponse<Any>, completionHandler: ResponseHandler?) {
        //debugPrint(response)

        // http code
        let httpStatusCode = HttpStatusCode(statusCode: response.response?.statusCode)

        switch response.result {
        case .success(let value):
            self.successWithValue(data: value as AnyObject, httpStatusCode: httpStatusCode, completionHandler: completionHandler)

        case .failure(let error):
            self.failureWithError(error: error, data: response.data, httpStatusCode: httpStatusCode, completionHandler: completionHandler)
        }
    }

    private func successWithValue(data: AnyObject, httpStatusCode: HttpStatusCode?, completionHandler: ResponseHandler?) {

        // create obj response
        let status = APIStatus(statusCode: httpStatusCode, messageCode: nil)
        let responseObject = ResponseObject(data: data, status: status)

        // block
        completionHandler?(responseObject)

    }

    private func failureWithError(error: Error?, data: Data? = nil, httpStatusCode: HttpStatusCode?, completionHandler: ResponseHandler?) {
        var errorCode: HttpStatusCode? = httpStatusCode
        var errorMessage: String?

        // check error code
        if error?._code == NSURLErrorTimedOut {  // Time out
            errorCode = HttpStatusCode(rawValue: NSURLErrorTimedOut)
        } else if error?._code == NSURLErrorCancelled {  // Cancelled
            errorCode = HttpStatusCode(rawValue: NSURLErrorCancelled)
        } else if error?._code == NSURLErrorNotConnectedToInternet { // Not connected to internet
            errorCode = HttpStatusCode(rawValue: NSURLErrorNotConnectedToInternet)
        } else if error?._code == NSURLErrorCannotFindHost { // Can not Find Host
            errorCode = HttpStatusCode(rawValue: NSURLErrorCannotFindHost)
        } else {  // Orther
            if let _data = data {
                let errorObject = JSON(_data)
                errorMessage = errorObject["message"].string
            }
        }

        // create obj response
        let status = APIStatus(statusCode: errorCode, messageCode: errorMessage)
        let responseObject = ResponseObject(data: nil, status: status)

        // block
        completionHandler?(responseObject)
    }

    // MARK: - Request
    func request(urlRequest: URLRequestConvertible, completionHandler: ResponseHandler? = nil) -> Request? {

        // Request
        return manager.request(urlRequest).validate().responseJSON { (response) in
            // analyze response
            self.analyzeResponse(response: response, completionHandler: completionHandler)
        }
    }

}
