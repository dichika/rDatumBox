rDatumBox <- setRefClass(Class="rDatumBox",
                         fields = list(apikey="character"
                         )
)


rDatumBox$methods(
  getResult = function(text=NULL, method=NULL) {
    require(httr)
    require(jsonlite)
    if(any(is.null(text), is.null(method))){
      stop("text and method must be required")
    }
    baseURL <- switch(method,
                      "sent"="http://api.datumbox.com/1.0/SentimentAnalysis.json",
                      "tsent"="http://api.datumbox.com/1.0/TwitterSentimentAnalysis.json",
                      "subj"="http://api.datumbox.com/1.0/SubjectivityAnalysis.json",
                      "topic"="http://api.datumbox.com/1.0/TopicClassification.json",
                      "spam"="http://api.datumbox.com/1.0/SpamDetection.json",
                      "adult"="http://api.datumbox.com/1.0/AdultContentDetection.json",
                      "readability"="http://api.datumbox.com/1.0/ReadabilityAssessment.json",
                      "lang"="http://api.datumbox.com/1.0/LanguageDetection.json",
                      "commerce"="http://api.datumbox.com/1.0/CommercialDetection.json",
                      "edu"="http://api.datumbox.com/1.0/EducationalDetection.json",
                      "gender"="http://api.datumbox.com/1.0/GenderDetection.json",
                      stop('method is chosen from "sent","tsent","subj","topic","spam","adult","readbility","lang","commerce","edu","gender"')
    )
    url <- URLencode(sprintf("%s?api_key=%s&text=%s", baseURL, apikey, text))
    req <- GET(url)
    req <- content(req, as="text")
    res <- fromJSON(req)    
  })