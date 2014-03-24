rDatumBox
=========
This is DatumBox API client for R.

## Example
```
# At first, you have to get APIkey at DatumBox.
# http://www.datumbox.com/users/register/

library(devtools)
install_github("dichika/rDatumBox")

yourkey <- "Your APIkey"
yourtxt <- "Hello, this is rDatumBox."

library(rDatumBox)
rd <- rDatumBox$new(apikey=yourkey)

res <- rd$getResult(text=yourtxt, method="sent") # Sentiment Analysis
res <- rd$getResult(text=yourtxt, method="tsent") # Twitter Sentiment Analysis
res <- rd$getResult(text=yourtxt, method="subj") # Subjectivity Analysis
res <- rd$getResult(text=yourtxt, method="topic") # Topic Classification
res <- rd$getResult(text=yourtxt, method="spam") # Spam Detection
res <- rd$getResult(text=yourtxt, method="adult") # Adult Content Detection 
res <- rd$getResult(text=yourtxt, method="readability") # Readability Assessment
res <- rd$getResult(text=yourtxt, method="lang") # Language Detection 
res <- rd$getResult(text=yourtxt, method="commerce") # Commercial Detection 
res <- rd$getResult(text=yourtxt, method="edu") # Educational Detection
res <- rd$getResult(text=yourtxt, method="gender") # Gender Detection 
```
You can use all functions of DatumBox API.
For details, see [DatumBox API document](http://www.datumbox.com/files/API-Documentation-1.0v.pdf).