### PACKAGE IMPORTS ===========================================================
library(yaml)
library(glue)
library(mailR)

### YAML IMPORT AND USEFUL VALUES DEFINITION ==================================
params    <- yaml.load_file("params.yaml")
sender    <- params$sender
targets   <- params$recipients
subject   <- params$subject
pw        <- Sys.getenv("MAIL_PWD")
smtp      <- params$outlook_smtp
form_url  <- params$form_url
smtp_info <- list(host.name = smtp, port = 587, user.name = sender, passwd = pw, tls = TRUE)

### EMAIL BODY COMPOSITION ====================================================
body <- glue("Bonjour les loufettes et loufs! \n\n
              Vous pourriez compléter ce <a href='{form_url}'>Google form</a>?\n 
              Grosses bises, on vous envoie les résultats rapidement!")
body <- paste(body)

### SENDING EMAIL TO TARGETS ==================================================
email <- send.mail(from = sender, to = targets, subject = subject, body = body, 
                   smtp = smtp_info, html = TRUE, authenticate = TRUE)