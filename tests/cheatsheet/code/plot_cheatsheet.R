# Plots for the quanteda cheatsheet

library(quanteda)


###
# Wordcloud
###

pdf(file = "textplot_wordcloud.pdf", width = 5, height = 5)
textplot_wordcloud(dfm(corpus_subset(data_corpus_inaugural,
                                     President=="Obama"), remove = stopwords("english"),
                       remove_punct = TRUE), max.words = 50)
dev.off()

###
# X-Ray Plot
###

textplot_xray(kwic(corpus_subset(data_corpus_inaugural, Year > 2000), "american"))
ggsave("plots/textplot_xray.pdf", width = 4, height = 3)

###
# Keyness plot
###

pres_dfm <- dfm(corpus_subset(data_corpus_inaugural, 
                              President %in% c("Obama", "Trump")), 
                groups = "President", 	remove = stopwords("english"), 
                remove_punct = TRUE) 

textplot_keyness(textstat_keyness(pres_dfm, target = "Trump"))
ggsave("plots/textplot_keyness.pdf", width = 8, height = 5)

###
# Wordscores plot
###
           
ie_dfm <- dfm(data_corpus_irishbudget2010)
doclab <- apply(docvars(data_corpus_irishbudget2010, c("name", "party")), 
                1, paste, collapse = " ")

refscores <- c(rep(NA, 4), -1, 1, rep(NA, 8))
ws <- textmodel(ie_dfm, refscores, model="wordscores", smooth = 1)
pred <- predict(ws)
# plot estimated word positions
textplot_scale1d(pred, margin = "features", 
                 highlighted = c("minister", "have", "our", "budget"))
# plot estimated document positions
textplot_scale1d(pred, margin = "documents",
                 doclabels = doclab,
                 groups = docvars(data_corpus_irishbudget2010, "party"))
ggsave("plots/textplot_scale1d.pdf", width = 4.2, height = 3)


