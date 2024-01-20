# https://mailtrap.io/blog/r-send-email/
# Install JAVA JDK FIRST 
library(mailR)

sender <- "gintonewsletter@outlook.com"
recipients <- c("guidallemagne@hotmail.com", "jeremy.minet.97@hotmail.com")
subject <- "Test email via Rscript"
body <- "Hello mon louf, cet email a été envoyé depuis R"
pw <- "bouzoulewifi69"
outlook_smtp <- "smtp-mail.outlook.com"

smtp_info <- list(host.name = outlook_smtp, port = 587, user.name = sender, passwd = pw, tls = TRUE)

status <- send.mail(from = sender,
                    to = recipients,
                    subject = subject,
                    body = body,
                    smtp = smtp_info,
                    authenticate = TRUE,
                    send = TRUE)
