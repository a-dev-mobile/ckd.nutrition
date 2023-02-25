
class Failure implements Exception {
  
  /// Expected value is null or empty
  const Failure.empty();

    /// Represents 400 error
  const  Failure.badRequest() ;
  
  ///  Expected value has invalid format
  const Failure.unprocessableEntity({required String message});

}
