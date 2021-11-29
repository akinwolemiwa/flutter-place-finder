// a neat way to input api endpoint int the code then call it to the webservice

class UrlHelper {
  static String urlForPlacesLocation(
      String keyword, double latitude, double longitude) {
    return 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$keyword&location=$latitude,$longitude&radius=1500&type=restaurant&key=AIzaSyC3cVwVYapy4myXB8lXf-tXiR7NFfngn4w';
  }
}
