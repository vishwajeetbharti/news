class ApiEndPoints {
  static String newsDetailApi(String cate, String query) =>
      'https://newsapi.org/v2/top-headlines?category=$cate&q=$query&apiKey=4ea3f552ce68406986b89462dab80d1d';
}
