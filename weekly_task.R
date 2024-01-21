### CUSTOM IMPORTS
source("common.R")

### MAIN
subject   <- "Weekly task"
form_url  <- "https://forms.gle/LMMjeNuUFEE3u48y8"

body      <- glue("Bonjour les loufettes et loufs! \n\n
              Vous pourriez compléter ce <a href='{form_url}'>Google form</a>?\n 
              Grosses bises, on vous envoie les résultats rapidement!")
body      <- paste(body)

send_mail(subject,body)