import 'dart:convert';
import 'package:http/http.dart' as http;

class AppHttpClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  AppHttpClient({
    required this.baseUrl,
    this.defaultHeaders = const {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  });

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.parse(baseUrl + endpoint).replace(
      queryParameters: queryParameters,
    );
    
    final mergedHeaders = {...defaultHeaders, ...?headers};
    
    final response = await http.get(
      uri,
      headers: mergedHeaders,
    );
    
    return response;
  }

  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final uri = Uri.parse(baseUrl + endpoint);
    final mergedHeaders = {...defaultHeaders, ...?headers};
    
    final response = await http.post(
      uri,
      headers: mergedHeaders,
      body: body != null ? jsonEncode(body) : null,
    );
    
    return response;
  }

  Future<http.Response> put(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final uri = Uri.parse(baseUrl + endpoint);
    final mergedHeaders = {...defaultHeaders, ...?headers};
    
    final response = await http.put(
      uri,
      headers: mergedHeaders,
      body: body != null ? jsonEncode(body) : null,
    );
    
    return response;
  }

  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(baseUrl + endpoint);
    final mergedHeaders = {...defaultHeaders, ...?headers};
    
    final response = await http.delete(
      uri,
      headers: mergedHeaders,
    );
    
    return response;
  }
}